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
    required this.senderKeyStore,
  });

  final IdentityKeyPair identityKeyPair;
  final List<PreKeyRecord> preKeys;
  final SignedPreKeyRecord signedPreKey;
  final InMemorySessionStore sessionStore;
  final InMemoryPreKeyStore preKeyStore;
  final InMemorySignedPreKeyStore signedPreKeyStore;
  final InMemoryIdentityKeyStore identityStore;
  final InMemorySenderKeyStore senderKeyStore;
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
    final senderKeyStore = InMemorySenderKeyStore();

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
        registrationId: registrationId,
        senderKeyStore: senderKeyStore);
  }

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

  // Groups

  Future<SenderKeyName> getSenderKeyName(String groupId, String email) async {
    return SenderKeyName(groupId, SignalProtocolAddress(email, 1));
  }

  Future<void> createGroupSession(
    String groupId,
    String senderId,
    void Function(String, SenderKeyDistributionMessageWrapper)
        sendDistributionMessageToMembers,
  ) async {
    final senderKeyName = await getSenderKeyName(groupId, senderId);
    final groupSessionBuilder = GroupSessionBuilder(senderKeyStore);

    final distributionMessage = await groupSessionBuilder.create(
      senderKeyName,
    );

    // storing group session
    // final senderKeyRecord = await senderKeyStore.loadSenderKey(senderKeyName);
    // if (senderKeyRecord.serialize().isEmpty) {
    //   await senderKeyStore.storeSenderKey(senderKeyName, senderKeyRecord);
    // }

    sendDistributionMessageToMembers(groupId, distributionMessage);

    // Idea: send a callback as parameter that will be handled in the repository
    // to send the message to the members
    // Or just return a half complete dto, and let the repository put in the
    // to field
  }

  // // OBSOLETE
  // Future<CiphertextMessage> encryptDistributionMessage(
  //   String email,
  //   SenderKeyDistributionMessageWrapper distributionMessage,
  // ) async {
  //   // print('Encrypting distribution message for $email');
  //   // final sessionCipher = await getSessionCipher(email);
  //   // final cipherText =
  //   //     await sessionCipher.encrypt(distributionMessage.serialize());
  //   // print('Type: ${cipherText.getType()}');
  //   // return cipherText;
  //   print('Encrypting distribution message for $email');
  //   final sessionCipher = await getSessionCipher(email);

  //   final serializedMessage = distributionMessage.serialize();
  //   print('Serialized SenderKeyDistributionMessage: $serializedMessage');

  //   final cipherText = await sessionCipher.encrypt(serializedMessage);
  //   print('Type: ${cipherText.getType()}');
  //   return cipherText;
  // }

  Future<void> registerGroupSession(
    String groupId,
    String senderId,
    // ez ugye stringben jon le, de majd a model decodeolja
    Uint8List ciphertext,
    int messageType,
  ) async {
    try {
      print('Registering group session');
      if (messageType == CiphertextMessage.senderKeyDistributionType) {
        print('Processing distribution message');
        final senderKeyName = await getSenderKeyName(groupId, senderId);
        final groupSessionBuilder = GroupSessionBuilder(senderKeyStore);
        final distributionMessage =
            SenderKeyDistributionMessageWrapper.fromSerialized(ciphertext);

        await groupSessionBuilder.process(senderKeyName, distributionMessage);

        // storing group session
        // i dont think it ever runs
        final senderKeyRecord =
            await senderKeyStore.loadSenderKey(senderKeyName);
        print(senderKeyRecord.serialize());
        if (senderKeyRecord.serialize().isEmpty) {
          print('Storing group session');
          await senderKeyStore.storeSenderKey(senderKeyName, senderKeyRecord);
        }
      }
    } catch (e, stackTrace) {
      print('Error registering group session: $e');
      print(stackTrace);
    }
  }

  Future<bool> groupSessionExists(String groupId, String email) async {
    final senderKeyName = await getSenderKeyName(groupId, email);
    final senderKeyRecord = await senderKeyStore.loadSenderKey(senderKeyName);
    return senderKeyRecord.serialize().isNotEmpty;
  }

  Future<Uint8List?> encryptGroupMessage(
    String groupId,
    String email,
    String message,
  ) async {
    try {
      final senderKeyName = await getSenderKeyName(groupId, email);
      final groupSessionCipher = GroupCipher(senderKeyStore, senderKeyName);

      final ciphertext = await groupSessionCipher.encrypt(
        Uint8List.fromList(utf8.encode(message)),
      );

      return ciphertext;
    } catch (e, stackTrace) {
      print('Error encrypting group message: $e');
      print(stackTrace);
      return null;
    }
  }

  Future<String?> decryptGroupMessage(
      String groupId, String email, Uint8List cipherText) async {
    try {
      final senderKeyName = await getSenderKeyName(groupId, email);
      final groupSessionCipher = GroupCipher(senderKeyStore, senderKeyName);

      final plaintext = await groupSessionCipher.decrypt(cipherText);

      return utf8.decode(plaintext);
    } catch (e, stackTrace) {
      print('Error decrypting group message: $e');
      print(stackTrace);
      return null;
    }
  }

  // Future<bool> groupSessionExists(String groupId, String senderEmail) async {
  //   final senderKeyName = await getSenderKeyName(groupId, senderEmail);
  //   final senderKeyRecord = await senderKeyStore.loadSenderKey(senderKeyName);
  //   return senderKeyRecord.serialize().isNotEmpty;
  // }
}
