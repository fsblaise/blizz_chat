import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseUserRepository extends CollectionsRepository {
  BaseUserRepository(super.fStore);

  Future<FbUser> getUser(String id);
  Future<void> updateUser(FbUser user);
}
