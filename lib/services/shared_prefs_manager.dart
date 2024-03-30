import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save user data
  static Future<bool> saveUserData(String userData) async {
    return await _prefs?.setString('userData', userData) ?? false;
  }

  // Get user data
  static String? getUserData() {
    return _prefs?.getString('userData');
  }

  // Save token
  static Future<bool> saveToken(String token) async {
    return await _prefs?.setString('token', token) ?? false;
  }

  // Get token
  static String? getToken() {
    return _prefs?.getString('token');
  }

  // Clear user data
  static Future<bool> clearUserData() async {
    return await _prefs?.remove('userData') ?? false;
  }

  // Clear token
  static Future<bool> clearToken() async {
    return await _prefs?.remove('token') ?? false;
  }

  // Method to clear all data
  static Future<bool> clearAll() async {
    return await _prefs?.clear() ?? false;
  }
}
