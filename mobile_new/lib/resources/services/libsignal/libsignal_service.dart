import 'dart:convert';
import 'dart:typed_data';

import 'package:blizz_chat/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:libsignal_protocol_dart/libsignal_protocol_dart.dart';

@Singleton()
class LibsignalService {
  LibsignalService({
    required this.identityKeyPair,
    required this.preKeys,
    required this.signedPreKey,
    required this.sessionStore,
    required this.preKeyStore,
    required this.signedPreKeyStore,
    required this.identityStore,
    required this.registrationId,
  });

  final IdentityKeyPair identityKeyPair;
  final List<PreKeyRecord> preKeys;
  final SignedPreKeyRecord signedPreKey;
  final InMemorySessionStore sessionStore;
  final InMemoryPreKeyStore preKeyStore;
  final InMemorySignedPreKeyStore signedPreKeyStore;
  final InMemoryIdentityKeyStore identityStore;
  final int registrationId;

  @FactoryMethod(preResolve: true)
  static Future<LibsignalService> initialize() async {
    final identityKeyPair = generateIdentityKeyPair();
    final preKeys = generatePreKeys(0, 110);
    final signedPreKey = generateSignedPreKey(identityKeyPair, 0);

    final sessionStore = InMemorySessionStore();
    final preKeyStore = InMemoryPreKeyStore();
    final signedPreKeyStore = InMemorySignedPreKeyStore();
    final registrationId = generateRegistrationId(false);
    final identityStore =
        InMemoryIdentityKeyStore(identityKeyPair, registrationId);

    for (var p in preKeys) {
      await preKeyStore.storePreKey(p.id, p);
    }
    await signedPreKeyStore.storeSignedPreKey(signedPreKey.id, signedPreKey);

    return LibsignalService(
        identityKeyPair: identityKeyPair,
        preKeys: preKeys,
        signedPreKey: signedPreKey,
        sessionStore: sessionStore,
        preKeyStore: preKeyStore,
        signedPreKeyStore: signedPreKeyStore,
        identityStore: identityStore,
        registrationId: registrationId);
  }

//   //1. get public part in String format from IdentityKeyPair
//   String getIdentityPublicKey({required IdentityKeyPair identityKeyPair}) {
// return base64.encode(identityKeyPair.getPublicKey().serialize());
// }

// //2. registration id is in int format so it can be send directly to server

// //3. get public part in String from signedPreKeyRecord
//  String getSignedKeyPublic( {required SignedPreKeyRecord signedPreKeyRecord}) {
//       return base64.encode(signedPreKeyRecord.getKeyPair().publicKey.serialize());
// }

// //4. get signedKeySignature in String format from signedPreKeyRecord
// String getSignedKeySignature(
//       {required SignedPreKeyRecord signedPreKeyRecord}) {
//     return base64.encode(signedPreKeyRecord.signature);
//   }

// //5. getSignedId from signedPreKeyRecord

// int getSignedIdFromSignedPreKeyRecord(
//       {required SignedPreKeyRecord signedPreKeyRecord}) {
//     return signedPreKeyRecord.id;
//   }
// //6. prekeys in string format

  // final retrievedPreKey = PreKeyBundle(
  //     remoteRegId,
  //     1,
  //     remotePreKeys[0].id,
  //     remotePreKeys[0].getKeyPair().publicKey,
  //     remoteSignedPreKey.id,
  //     remoteSignedPreKey.getKeyPair().publicKey,
  //     remoteSignedPreKey.signature,
  //     remoteIdentityKeyPair.getPublicKey());

  ShareKeysDto getPublicKeys() {
    return ShareKeysDto.fromLibsignal(
        registrationId, identityKeyPair, preKeys, signedPreKey);
  }

  Future<void> createSession(
      String remoteUserEmail, PreKeyBundle preKeyBundle) async {
    final remoteAddress = SignalProtocolAddress(remoteUserEmail, 1);
    final sessionBuilder = SessionBuilder(
      sessionStore,
      preKeyStore,
      signedPreKeyStore,
      identityStore,
      remoteAddress,
    );

    await sessionBuilder.processPreKeyBundle(preKeyBundle);
  }

  Future<SessionCipher> getSessionCipher(String remoteUserEmail) async {
    final remoteAddress = SignalProtocolAddress(remoteUserEmail, 1);
    return SessionCipher(
      sessionStore,
      preKeyStore,
      signedPreKeyStore,
      identityStore,
      remoteAddress,
    );
  }

  Future<CiphertextMessage> encryptMessage(
      String remoteUserEmail, String message) async {
    final sessionCipher = await getSessionCipher(remoteUserEmail);
    final messageBytes = utf8.encode(message);
    final ciphertext =
        await sessionCipher.encrypt(Uint8List.fromList(messageBytes));
    print(ciphertext.getType());
    return ciphertext;
  }

  Future<String> decryptMessage(
      String remoteUserEmail, Uint8List ciphertext, int messageType) async {
    try {
      final sessionCipher = await getSessionCipher(remoteUserEmail);

      if (messageType == CiphertextMessage.prekeyType) {
        final preKeySignalMessage = PreKeySignalMessage(ciphertext);
        final plaintext =
            await sessionCipher.decryptWithCallback(preKeySignalMessage, (msg) {
          print(msg);
        });
        return utf8.decode(plaintext);
      } else if (messageType == CiphertextMessage.whisperType) {
        final signalMessage = SignalMessage.fromSerialized(ciphertext);
        final plaintext = await sessionCipher
            .decryptFromSignalWithCallback(signalMessage, (msg) {
          print(msg);
        });
        return utf8.decode(plaintext);
      } else {
        throw Exception('Unknown message type: $messageType');
      }
    } catch (e, stackTrace) {
      print('Error decrypting message: $e');
      print(stackTrace);
      rethrow;
    }
  }
}
