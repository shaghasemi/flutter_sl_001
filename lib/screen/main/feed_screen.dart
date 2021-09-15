import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/screen/panel/signup_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    bool _loginState = false;
    String _loginStringState = "Default";
    // setState(() {
    var token = MySharedPreferences.myShrdPref.getString('token');
    // token == null ? _loginState = true : _loginState = false;
    /*_loginState = token == null;
      _loginState
          ? _loginStringState = "Not Logged In"
          : _loginStringState = "Logged In";*/
    // });
    updateLoginState() {
      setState(() {
        _loginState = token == null;
        _loginState
            ? _loginStringState = "Not Logged In"
            : _loginStringState = "Logged In";
      });
      return _loginStringState;
    }

    /*String token =
        MySharedPreferences.mySharedPreferences.getString('token').toString();*/
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar: Feed Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            // Text("Feed"),
            Text(updateLoginState()),
            ElevatedButton(
              onPressed: () {
                MySharedPreferences.myShrdPref.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()));
              },
              child: const Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
