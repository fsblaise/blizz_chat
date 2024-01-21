import 'package:blizz_chat/features/core/application/user_controller.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/map/infrastructure/map_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_data.g.dart';

@riverpod
Future<List<FbUser>?> mapData(MapDataRef ref) async {
  final user = await ref.watch(userControllerProvider.future);
  final mapContacts = await ref.watch(mapRepositoryProvider).getMapUsers(user.contacts);
  return mapContacts;
}
