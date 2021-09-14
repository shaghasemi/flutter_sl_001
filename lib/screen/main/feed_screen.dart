import 'package:flutter/material.dart';
// import 'package:flutter_sl_001/data/local/mySharedPref.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* bool _loginState = false;
    String _loginStringState = "";
    var token = MySharedPreferences.mySharedPreferences.getString('token');
    token == null ? _loginState = true : _loginState = false;
    _loginState
        ? _loginStringState = "Not Logged In"
        : _loginStringState = "Logged In";*/

    /*String token =
        MySharedPreferences.mySharedPreferences.getString('token').toString();*/
    return Center(
      child: Column(
        children: const [
          Text("Feed"),
          // Text(_loginStringState),
          /*ElevatedButton(
            onPressed: () {
              MySharedPreferences.mySharedPreferences.clear();
            },
            child: const Text("Log Out"),
          )*/
        ],
      ),
    );
  }
}
