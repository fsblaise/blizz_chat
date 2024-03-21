import 'package:blizz_chat/features/auth/infrastructure/auth_provider.dart';
import 'package:blizz_chat/features/core/domain/user_model.dart';
import 'package:blizz_chat/features/core/infrastructure/user_provider.dart';
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<FbUser> build() async {
    print('build runs inside user controller');
    final user = ref.watch(loggedInUserProvider);
    FbUser userObj = await ref.watch(userRepositoryProvider).getUser(user!.uid);
    print(userObj);
    return userObj;
  }

  FutureOr<FbUser> updateUser(FbUser user) async {
    await ref.watch(userRepositoryProvider).updateUser(user);
    state = AsyncValue.data(user);
    return user;
  }

  FutureOr<FbUser> updateUserLocation(LocationData? locationData, bool useLocation) async {
    final user = await future;

    if (locationData == null) {
      user.location['coords'] = '';
      user.location['useLocation'] = useLocation;
      await ref.watch(userRepositoryProvider).updateUser(user);
    } else {
      user.location['coords'] = '${locationData.latitude}_${locationData.longitude}';
      user.location['useLocation'] = useLocation;
      await ref.watch(userRepositoryProvider).updateUser(user);
    }

    state = AsyncValue.data(user);
    return user;
  }
}
