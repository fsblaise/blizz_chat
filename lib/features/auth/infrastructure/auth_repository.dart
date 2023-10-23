import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  const AuthRepository(this._auth, this._fStore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _fStore;

  Future signUp(FbUser user, String password) async {
    try {
      UserCredential authUser = await _auth.createUserWithEmailAndPassword(email: user.email, password: password);
      user.id = (authUser.user?.uid).toString();
      Map<String, dynamic> jsonUser = user.toJson();
      await _fStore.collection('Users').doc(user.id).set(jsonUser);
      return user;
    } catch (e) {
      print(e);
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
