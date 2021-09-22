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
    var token = MySharedPreferences.mySharedPreferences.getString('token');
    _loginState = token == null;
    _loginState
        ? _loginStringState = "Not Logged In"
        : _loginStringState = "Logged In";
    updateLoginState() {
      setState(() {
        _loginState = token == null;
        _loginState
            ? _loginStringState = "Not Logged In"
            : _loginStringState = "Logged In";
      });
      return _loginStringState;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("App Bar: Feed Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(updateLoginState()),
            ElevatedButton(
              onPressed: () {
                MySharedPreferences.mySharedPreferences.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
              child: const Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
