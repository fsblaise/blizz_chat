import 'package:blizz_chat/features/auth/infrastructure/auth_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/core/infrastructure/firebase_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref.read(firebaseAuthProvider), ref.read(firebaseFirestoreProvider));
}

@riverpod
Stream<User?> userStream(UserStreamRef ref) {
  FirebaseAuth auth = ref.read(firebaseAuthProvider);
  return auth.authStateChanges();
}

@riverpod
User? loggedInUser(LoggedInUserRef ref) {
  FirebaseAuth auth = ref.read(firebaseAuthProvider);
  return auth.currentUser;
}

// @riverpod
// Future<FbUser> userObject(UserObjectRef ref) async {
//   FirebaseAuth auth = ref.read(firebaseAuthProvider);
//   FirebaseFirestore fstore = ref.read(firebaseFirestoreProvider);
//   final userSnapshot = await fstore.collection('Users').doc(auth.currentUser!.uid).get();
//   final userMap = userSnapshot.data() as Map<String, dynamic>;
//   final user = FbUser.fromJson(userMap);
//   print(user);
//   return user;
// }
