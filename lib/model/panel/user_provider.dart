import 'package:flutter/foundation.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserProvider with ChangeNotifier {
  LoginData _user = new LoginData();

  LoginData get user => _user;

  void setUser(LoginData user) {
    _user = user;
    notifyListeners();
  }
}
