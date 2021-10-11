import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({bool? shouldRebuild = false, Key? key})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool _loginState = false;
    // bool _loginState = true;
    setState(() {
      _loginState =
          UserPreferences.prefs.getString('token') != null;
    });
    print(_loginState);

    return Scaffold(
      body: _loginState ? const ProfileScreenContent() : const LoginScreen(),
    );
  }
}
