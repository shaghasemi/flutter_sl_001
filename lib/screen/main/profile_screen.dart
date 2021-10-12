import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/provider_test/user_provider.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({bool? shouldRebuild = false, Key? key})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    /*bool _loginState = false;
    late String? _token;
    Consumer<UserProvider>(
      builder: (context, value, _) {
        _token = value.user.token!;
        _loginState = _token == "" ? false : true;
        print(_loginState);
        return Column(
          children: [
            Text(_token!),
            Text(_loginState.toString()),
          ],
        );
      },
    );*/
    // bool _loginState = true;
    /*setState(() {
      _loginState =
          UserPreferences.prefs.getString('token') != null;
    });*/

    return Scaffold(
      // body: _loginState ? const ProfileScreenContent() : const LoginScreen(),
      body: const LoginScreen(),
    );
  }
}
