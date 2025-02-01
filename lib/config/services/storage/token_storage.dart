import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _tokenKey = 'auth_token';
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // Token Save Karna
  static Future<void> saveToken(String token, SharedPreferences? prefs) async {
    await prefs!.setString(_tokenKey, token);
  }

  // Token Get Karna
  static Future<String?> getToken(SharedPreferences? prefs) async {
    return prefs!.getString(_tokenKey);
  }

  // Token Remove Karna (Logout)
  static Future<void> removeToken(SharedPreferences? prefs) async {
    await prefs!.remove(_tokenKey);
  }
}
