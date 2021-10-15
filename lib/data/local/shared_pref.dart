import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';

class UserPreferences {
  static late SharedPreferences newPrefs;
  // static late SharedPreferences newPrefs;
  // final SharedPreferences newPrefs = await SharedPreferences.getInstance();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Future.delayed(const Duration(seconds: 2));
    newPrefs = await SharedPreferences.getInstance();
  }

  // New Stuff
  Future<void> saveUser(LoginData user) async {
    // final SharedPreferences newPrefs = await SharedPreferences.getInstance();
    newPrefs.setString('id', user.id!);
    newPrefs.setString('mobile', user.mobile!);
    /*newPrefs.setString('name', user.userId!.name!);
      newPrefs.setString('family', user.userId!.family!);
      newPrefs.setInt('gender', user.userId!.gender!);
      newPrefs.setString('main_address', user.userId!.mainAddress!);
      newPrefs.setString('email', user.userId!.email!);
      newPrefs.setStringList('address_list', user.userId!.addressList!);
      newPrefs.setString('national_code', user.userId!.nationalCode!);
      newPrefs.setString('type', user.type!);*/
    newPrefs.setString('token', user.token!);
    // newPrefs.setString('token_mobile', user.token!);
  }

  /*Future<void> saveUserData(UserData userData) async {
    final SharedPreferences newPrefs = await SharedPreferences.getInstance();
    newPrefs.setString('id', userData.id_2);
  }*/

  Future<LoginData> getUser() async {
    // final SharedPreferences newPrefs = await SharedPreferences.getInstance();
    String? id = newPrefs.getString('id');
    String? mobile = newPrefs.getString('mobile');
    /*String? name = newPrefs.getString('name');
      String? family = newPrefs.getString('family');
      int? gender = newPrefs.getInt('gender');
      String? main_address = newPrefs.getString('main_address');
      String? email = newPrefs.getString('email');
      List<String>? address_list = newPrefs.getStringList('address_list');
      String? national_code = newPrefs.getString('national_code');
      String? type = newPrefs.getString('type');*/
    String token = newPrefs.getString('token')!;
    // String? token_mobile = newPrefs.getString('token_mobile');
    return LoginData(
      id: id,
      mobile: mobile,
      token: token,
      // token: token_mobile,
      /*userId: name,
        family: family,
        mobile: mobile,
        mobile: mobile,
        mobile: mobile,
        mobile: mobile,
        mobile: mobile,
        mobile: mobile,*/
    );
  }

  void removeUser() async {
    // final SharedPreferences newPrefs = await SharedPreferences.getInstance();
    newPrefs.remove('id');
    newPrefs.remove('mobile');
    newPrefs.remove('token');
  }

  Future<String> getToken() async {
    // final SharedPreferences newPrefs = await SharedPreferences.getInstance();
    String? token = newPrefs.getString('token');
    return token!;
  }
}
