import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/map/domain/base_map_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapRepository extends BaseMapRepository {
  MapRepository(this._fStore) : super(_fStore);

  final FirebaseFirestore _fStore;

  @override
  Future<List<User>?> getMapUsers(List<Map<String, dynamic>> contacts) async {
    print('contacts getting');
    List<String> ids =
        contacts.map((contact) => contact['id'] as String).toList();
    if (ids.isEmpty) return null;
    final userSnapshots = await userCollection
        .where('id', whereIn: ids)
        .where('location.useLocation', isEqualTo: true)
        .get();
    final userDocs = userSnapshots.docs;
    final users = userDocs.map((e) => User.fromJson(e.data())).toList();
    return users;
  }
}
