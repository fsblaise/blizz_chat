import 'dart:convert';

import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class SessionManager {
  SessionManager({required this.prefs});

  final SharedPreferences prefs;

  @FactoryMethod(preResolve: true)
  static Future<SessionManager> initialize() async {
    SharedPreferences prefs =
        getIt.get<SharedPreferencesService>().preferences!;
    return SessionManager(prefs: prefs);
  }

  static const String _sessionsKey = 'userSessions';
  static const String _currentSession = 'currentSession';

  Future<void> saveSession(String email,
      {String? apiUrl, String? companyName}) async {
    final sessionData = UserPrefsSession(
      email: email,
      apiUrl: apiUrl ?? '${dotenv.env['API_URL']}',
      companyName: companyName ?? 'Blizz Chat',
      isActive: true,
      user: null,
      token: null,
    );
    final sessions = await getSessions() ?? [];
    sessions.add(sessionData);
    await prefs.setString(_sessionsKey, jsonEncode(sessions));
  }

  List<UserPrefsSession>? getSessions() {
    final sessionsJson = prefs.getString(_sessionsKey);
    if (sessionsJson != null) {
      final json = jsonDecode(sessionsJson);
      return (json as List<dynamic>)
          .map((session) =>
              UserPrefsSession.fromJson(session as Map<String, dynamic>))
          .toList();
    }
    return null;
  }

  Future<void> updateSession(
      String email, String apiUrl, UserPrefsSession updatedSession) async {
    final sessions = await getSessions() ?? [];
    final updatedSessions = sessions.map((session) {
      if (session.email == email && session.apiUrl == apiUrl) {
        return updatedSession;
      }
      return session;
    }).toList();
    await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
  }

  Future<void> updateToken(String email, String apiUrl, String token) async {
    final sessions = await getSessions() ?? [];
    final updatedSessions = sessions.map((session) {
      if (session.email == email && session.apiUrl == apiUrl) {
        return session.copyWith(token: token);
      }
      return session;
    }).toList();
    await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
  }

  Future<void> setActiveSession(String email, String apiUrl) async {
    final sessions = await getSessions() ?? [];
    UserPrefsSession? activeSession;

    final updatedSessions = sessions.map((session) {
      if (session.email == email && session.apiUrl == apiUrl) {
        activeSession = session.copyWith(isActive: true);
        return activeSession;
      }
      return session.copyWith(isActive: false);
    }).toList();

    if (activeSession != null) {
      await prefs.setString(
        _currentSession,
        jsonEncode(activeSession!.toJson()),
      );
    }

    await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
  }

  UserPrefsSession? getCurrentSession() {
    final currentSessionJson = prefs.getString(_currentSession);
    if (currentSessionJson != null) {
      final decodedPref =
          jsonDecode(currentSessionJson) as Map<String, dynamic>;
      return UserPrefsSession.fromJson(decodedPref);
    }
    return null;
  }
}
