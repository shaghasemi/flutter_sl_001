import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';
import 'package:provider/provider.dart';

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
                UserPreferences.userPrefs.clear();
                UserPreferences().removeUser();
                Provider.of<UserProvider>(context, listen: false)
                    .removeUser(); // UserPreferences().removeUser();
                // Here we need to handle events that rely on login status
                // Cart Screen should be refreshed
                // AppHome.build
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
