import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserProvider extends ChangeNotifier {
  LoginData _user = new LoginData();

  LoginData get getUser => _user;

  void setUser(LoginData user) {
    _user = user;
    // UserPreferences().saveUser(user);
    notifyListeners();
  }

  void removeUser() {
    _user = LoginData();
    // UserPreferences().saveUser(user);
    notifyListeners();
  }
}
