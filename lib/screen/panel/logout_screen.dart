import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/screen/main/profile_screen.dart';

class LogoutGlobalScreen extends StatefulWidget {
  const LogoutGlobalScreen({Key? key}) : super(key: key);

  @override
  _LogoutGlobalScreenState createState() => _LogoutGlobalScreenState();
}

class _LogoutGlobalScreenState extends State<LogoutGlobalScreen> {
  Widget build(BuildContext context) {
    // bool _loginState = false;
    // bool _loginState = true;
    String token = "";
    final bool _loginState =
        MySharedPreferences.mySharedPreferences.getString('token')!.isNotEmpty;
    if (_loginState == true) {
      token = MySharedPreferences.mySharedPreferences.getString('token')!;
    }
    // _loginState == true ?
    // if (_loginState){};

    return Container(
      child: Column(
        children: [
          Text(_loginState == true ? token : "Not Logged In"),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  MySharedPreferences.mySharedPreferences.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                  );
                },
              );
            },
            child: Text(
              _loginState == true ? "LOGOUT" : "Not Logged In",
            ),
          ),
        ],
      ),
    );
  }
}
