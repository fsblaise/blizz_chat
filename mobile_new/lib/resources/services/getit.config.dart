// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'connection/connection_service.dart' as _i3;
import 'database/database_service.dart' as _i664;
import 'dialogs/dialog_service.dart' as _i178;
import 'libsignal/libsignal_service.dart' as _i1028;
import 'preferences/preferences.dart' as _i774;
import 'preferences/shared_preferences/session_manager.dart' as _i377;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.singletonAsync<_i664.DatabaseService>(
      () => _i664.DatabaseService.initialize(),
      preResolve: true,
    );
    await gh.singletonAsync<_i774.SharedPreferencesService>(
      () => _i774.SharedPreferencesService.init(),
      preResolve: true,
    );
    await gh.singletonAsync<_i377.SessionManager>(
      () => _i377.SessionManager.initialize(),
      preResolve: true,
    );
    await gh.singletonAsync<_i3.ConnectionService>(
      () => _i3.ConnectionService.initialize(),
      preResolve: true,
    );
    await gh.singletonAsync<_i1028.LibsignalService>(
      () => _i1028.LibsignalService.initialize(),
      preResolve: true,
    );
    await gh.singletonAsync<_i178.DialogService>(
      () => _i178.DialogService.initialize(),
      preResolve: true,
    );
    return this;
  }
}
