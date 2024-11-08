import 'dart:convert';

import 'package:blizz_chat/models/models.dart';
import 'package:blizz_chat/resources/services/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages the user sessions in sharedpreferences.
/// It makes possible to have multiple user profiles and api urls in the app.
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

  /// Saves the session in the session list (sharedpreferences).
  Future<void> saveSession(String email,
      {String? apiUrl, String? companyName}) async {
    final sessions = await getSessions() ?? [];
    final sessionExists = sessions.any((session) =>
        session.email == email &&
        session.apiUrl == (apiUrl ?? '${dotenv.env['API_URL']}'));

    if (!sessionExists) {
      final sessionData = UserPrefsSession(
        email: email,
        apiUrl: apiUrl ?? '${dotenv.env['API_URL']}',
        companyName: companyName ?? 'Blizz Chat',
        isActive: true,
        user: null,
        token: null,
      );
      sessions.add(sessionData);
      await prefs.setString(_sessionsKey, jsonEncode(sessions));
    }
  }

  /// Fetches the session list from sharedpreferences.
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

  /// Updates the session in the session list (sharedpreferences).
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

  /// Updates the current session with the provided token and user.
  /// These values are fetched from the API during signin/signup.
  /// Also updates the session in the session list (sharedpreferences).
  Future<void> handleAuth(String token, UserProfile user) async {
    final currentSession = getCurrentSession();
    print(jsonEncode(currentSession?.toJson()));
    if (currentSession != null && currentSession.email == user.email) {
      // updating current session
      final updatedCurrentSession =
          currentSession.copyWith(token: token, user: user);
      await prefs.setString(
          _currentSession, jsonEncode(updatedCurrentSession.toJson()));

      // updating the same session in the list
      final sessions = await getSessions() ?? [];
      final updatedSessions = sessions.map((session) {
        if (session.email == user.email &&
            session.apiUrl == currentSession.apiUrl) {
          return session.copyWith(token: token, user: user);
        }
        return session;
      }).toList();
      await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
    }
  }

  /// Sets the active session in the session list (sharedpreferences), based on the provided parameters.
  Future<void> setActiveSession(String email, {String? apiUrl}) async {
    if (apiUrl == null) {
      apiUrl = '${dotenv.env['API_URL']}';
    }
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

  /// Removes the active session from the session list (sharedpreferences).
  Future<void> removeActiveSession() async {
    final currentSession = getCurrentSession();
    if (currentSession != null) {
      await prefs.remove(_currentSession);

      final sessions = await getSessions() ?? [];
      final updatedSessions = sessions.map((session) {
        if (session.email == currentSession.email &&
            session.apiUrl == currentSession.apiUrl) {
          return session.copyWith(isActive: false);
        }
        return session;
      }).toList();

      await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
    }
  }

  /// Fetches the current session from the session list (sharedpreferences).
  UserPrefsSession? getCurrentSession() {
    final currentSessionJson = prefs.getString(_currentSession);
    if (currentSessionJson != null) {
      final decodedPref =
          jsonDecode(currentSessionJson) as Map<String, dynamic>;
      return UserPrefsSession.fromJson(decodedPref);
    }
    return null;
  }

  /// Deletes our current session from the session list (sharedpreferences).
  Future<void> signOut() async {
    final currentSession = getCurrentSession();
    if (currentSession != null) {
      await prefs.remove(_currentSession);

      final sessions = await getSessions() ?? [];
      final updatedSessions = sessions.where((session) {
        return session.email != currentSession.email ||
            session.apiUrl != currentSession.apiUrl;
      }).toList();

      await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
    }
  }

  /// Deletes the session from the session list (sharedpreferences).
  Future<void> signOutOtherSession(UserPrefsSession sessionToSignOut) async {
    final sessions = await getSessions() ?? [];
    final updatedSessions = sessions.where((session) {
      return session.email != sessionToSignOut.email ||
          session.apiUrl != sessionToSignOut.apiUrl;
    }).toList();

    await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));
  }

  // Future<void> removeSession(UserPrefsSession sessionToRemove) async {
  //   final sessions = await getSessions() ?? [];
  //   final updatedSessions = sessions.where((session) {
  //     return session.email != sessionToRemove.email ||
  //         session.apiUrl != sessionToRemove.apiUrl;
  //   }).toList();

  //   await prefs.setString(_sessionsKey, jsonEncode(updatedSessions));

  //   final currentSession = getCurrentSession();
  //   if (currentSession != null &&
  //       currentSession.email == sessionToRemove.email &&
  //       currentSession.apiUrl == sessionToRemove.apiUrl) {
  //     await prefs.remove(_currentSession);
  //   }
  // }

  /// Deletes every session from the session list (sharedpreferences).
  /// Basically it clears the list.
  Future<void> signOutOfAll() async {
    final sessions = await getSessions() ?? [];
    await prefs.setString(_sessionsKey, jsonEncode([]));
    await prefs.remove(_currentSession);
  }
}
