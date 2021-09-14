import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print(MySharedPreferences.myShrdPref.getString('token'));
    bool _loginState = false;
    setState(() {
      _loginState = MySharedPreferences.myShrdPref.getString('token') != null;
      print(MySharedPreferences.myShrdPref.getString('token') != null);
    });
    // print(_loginState);

    return Scaffold(
      // body: LoginScreen(),
      body: _loginState ? const ProfileScreenContent() : const LoginScreen(),
    );
  }
}
