part of '../preferences.dart';

@Singleton()
class SharedPreferencesService {
  SharedPreferencesService({this.preferences});
  final SharedPreferences? preferences;

  @FactoryMethod(preResolve: true)
  static Future<SharedPreferencesService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPreferencesService(preferences: prefs);
  }
}
