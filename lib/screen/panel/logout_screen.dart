import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/main.dart';
import 'package:flutter_sl_001/screen/main/profile_screen.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';

class LogoutGlobalScreen extends StatefulWidget {
  const LogoutGlobalScreen({Key? key}) : super(key: key);

  @override
  _LogoutGlobalScreenState createState() => _LogoutGlobalScreenState();
}

class _LogoutGlobalScreenState extends State<LogoutGlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(
              () {
                MySharedPreferences.mySharedPreferences.clear();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
            );
          },
          child: const Text("Log Out"),
        ),
      ],
    );
  }
}
