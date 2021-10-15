import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserProvider extends ChangeNotifier {
  LoginData _user = new LoginData(token: '');

  LoginData get getUser => _user;

  void setUser(LoginData user) {
    _user = user;
    notifyListeners();
  }
}
