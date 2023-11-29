import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CollectionsRepository {
  CollectionsRepository(this._fStore);

  final FirebaseFirestore _fStore;

  CollectionReference<Map<String, dynamic>> get userCollection {
    return _fStore.collection('Users');
  }

  CollectionReference<Map<String, dynamic>> get chatCollection {
    return _fStore.collection('Chats');
  }
}
