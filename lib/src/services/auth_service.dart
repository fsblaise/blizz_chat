import 'package:firebase_auth/firebase_auth.dart';
import 'package:blizz_chat/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fStore = FirebaseFirestore.instance;

  Future signUp(FbUser user, String password) async {
    try {
      UserCredential authUser = await auth.createUserWithEmailAndPassword(email: user.email, password: password);
      user.id = (authUser.user?.uid).toString();
      Map<String, dynamic> jsonUser = user.toJson();
      await fStore.collection('Users').doc(user.id).set(jsonUser);
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    return await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  User? getLoggedInUser() {
    return auth.currentUser;
  }

  userStream() {
    return auth.userChanges();
  }

  logOut() async {
    await auth.signOut();
  }
}
