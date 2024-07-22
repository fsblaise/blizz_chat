import 'package:blizz_chat/features/core/domain/base_user_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends BaseUserRepository {
  UserRepository(this._fStore) : super(_fStore);

  final FirebaseFirestore _fStore;

  @override
  Future<User> getUser(String id) async {
    final userSnapshot = await userCollection.doc(id).get();
    final userMap = userSnapshot.data() as Map<String, dynamic>;
    final user = User.fromJson(userMap);
    print(user);
    return user;
  }

  @override
  Future<void> updateUser(User user) async {
    // await userCollection.doc(user._id).set(user.toJson());
  }
}
