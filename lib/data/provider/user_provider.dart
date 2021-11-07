import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserProvider extends ChangeNotifier {
  LoginData userData = LoginData();

  // LoginData userData = new LoginData();
  late String _token;

  LoginData get getUser => userData;

  void setUser(LoginData user) {
    userData = user;
    UserPreferences().saveUser(userData);
    notifyListeners();
  }

  void editUser(LoginData user) {
    userData = user;
    UserPreferences().saveUser(userData);
    notifyListeners();
  }

  void loadUser() {
    userData = UserPreferences().getUser();
    notifyListeners();
  }

  void loadUserOnline() {
    userData = UserPreferences().getUser();
    notifyListeners();
  }

  void removeUser() {
    userData = LoginData();
    notifyListeners();
  }

  void setToken(String token) {
    _token = token;
    UserPreferences().saveToken(_token);
    notifyListeners();
  }

  void loadToken() {
    _token = UserPreferences().getToken();
    notifyListeners();
  }

  void removeToken() {
    userData = LoginData();
    notifyListeners();
  }

  // Async Section
  void loadUserAsync1() {
    UserPreferences().getUserAsync().then((value) => userData = value);
    notifyListeners();
  }

  void loadUserAsync2() {
    UserPreferences().getUserAsync().then((value) {
      userData = value;
      notifyListeners();
      // return _user;
    });
  }

  Future<LoginData> loadUserAsync3() async {
    UserPreferences().getUserAsync().then((value) => userData = value);
    notifyListeners();
    return userData;
  }

  void loadUserAsync4() {
    UserPreferences().getUserAsync().then((value) {
      userData = value;
      notifyListeners();
      // return _user;
    });
  }
}
