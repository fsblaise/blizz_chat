import 'package:blizz_chat/features/core/infrastructure/firebase_provider.dart';
import 'package:blizz_chat/features/map/infrastructure/map_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_provider.g.dart';

@riverpod
MapRepository mapRepository(MapRepositoryRef ref) {
  return MapRepository(ref.read(firebaseFirestoreProvider));
}
