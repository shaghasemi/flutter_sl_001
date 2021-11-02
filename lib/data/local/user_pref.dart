import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserPreferences {
  static late SharedPreferences userPrefs;

  // static late SharedPreferences newPrefs;
  // final SharedPreferences newPrefs = await SharedPreferences.getInstance();

  // I've made two kind of shared pref agents
  // This will check whether they need to be sync or async
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Future.delayed(const Duration(seconds: 2));
    userPrefs = await SharedPreferences.getInstance();
  }

  void saveToken(String token) {
    print("User Preferences: Save Token Called.");
    userPrefs.setString('token', jsonEncode(token));
  }

  String getToken() {
    print("User Preferences: Load Token Called.");
    String? token = userPrefs.getString('token');
    if (token == null) {
      throw Exception('Token Not Available!');
    } else {
      return jsonDecode(token);
    }
  }

  void saveUser(LoginData user) {
    print("User Preferences: Save User Called.");
    userPrefs.setString('user', jsonEncode(user));
  }

  LoginData getUser() {
    print("User Preferences: Load User Called.");
    String? user = userPrefs.getString('user');
    if (user == null) {
      throw Exception('User Not Available!');
    } else {
      return LoginData.fromJson(jsonDecode(user));
    }
  }

  void removeUser() {
    print("User Preferences: Remove User Called.");
    userPrefs.remove('user');
    userPrefs.remove('token');
  }

  Future<void> saveTokenAsync(String token) async {
    print("User Preferences: Save Token Called.");
    userPrefs.setString('token', jsonEncode(token));
  }

  Future<String?> getTokenAsync() async {
    print("User Preferences: Load Token Called.");
    String? token = userPrefs.getString('token');
    return jsonDecode(token!);
    /*if (token == null) {
      throw Exception('Token Not Available!');
    } else {
      return token;
    }*/
  }

  Future<void> saveUserAsync(LoginData user) async {
    print("User Preferences: Save User Called.");
    userPrefs.setString('user', jsonEncode(user));
  }

  Future<LoginData> getUserAsync() async {
    print("User Preferences: Async Load User Called.");
    String? user = userPrefs.getString('user');
    return jsonDecode(user!);
    /*if (user == null) {
      throw Exception('User Not Available!');
    } else {
      // return LoginData.fromJson(jsonDecode(user));
      return jsonDecode(user);
    }*/
  }

  void removeUserAsync() async {
    print("User Preferences: Remove User Called.");
    userPrefs.remove('user');
    userPrefs.remove('token');
  }
}
