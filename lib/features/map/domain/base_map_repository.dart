import 'package:blizz_chat/features/core/domain/collections_repository.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';

abstract class BaseMapRepository extends CollectionsRepository {
  BaseMapRepository(super.fStore);

  Future<List<FbUser>> getMapUsers(List<Map<String, dynamic>> contacts);
}
