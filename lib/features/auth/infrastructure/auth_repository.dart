import 'package:blizz_chat/features/auth/domain/sign_up_form.dart';
import 'package:blizz_chat/features/auth/domain/sign_up_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository extends SignUpRepository {
  AuthRepository(this._auth, this._fStore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _fStore;

  @override
  Future<FbUser?> signUp({required SignUpForm signUpForm}) async {
    try {
      UserCredential authUser =
          await _auth.createUserWithEmailAndPassword(email: signUpForm.email, password: signUpForm.password);
      FbUser user =
          FbUser(signUpForm.email, DateTime.now().toIso8601String(), signUpForm.name, (authUser.user?.uid).toString());
      Map<String, dynamic> jsonUser = user.toJson();
      await _fStore.collection('Users').doc(user.id).set(jsonUser);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  User? getLoggedInUser() {
    return _auth.currentUser;
  }

  userStream() {
    return _auth.userChanges();
  }

  logOut() async {
    await _auth.signOut();
  }
}
