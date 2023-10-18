import 'package:firebase_auth/firebase_auth.dart';
import 'package:blizz_chat/src/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fStore = FirebaseFirestore.instance;

  Future signUp(FbUser user, String password) async {
    try {
      UserCredential authUser = await auth.createUserWithEmailAndPassword(
          email: user.email, password: password);
      user.id = (authUser.user?.uid).toString();
      await fStore.collection('Users').doc(user.id).set({
        'id': user.id,
        'email': user.email,
        'created': user.created,
        'fullName': user.fullName
      });
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
