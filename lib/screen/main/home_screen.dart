// import 'dart:convert';
import 'package:flutter/material.dart';

// import 'package:flutter_sl_001/data/local/mySharedPref.dart';
// import 'package:flutter_sl_001/model/LoginModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*bool _loginState = false;
    var userData;
    var rawData =
        MySharedPreferences.mySharedPreferences.getString('user_data');
    if (rawData != null) {
      userData = LoginResponseModel.fromJson(jsonDecode(
          MySharedPreferences.mySharedPreferences.getString('user_data')!));
      _loginState = true;
    }*/

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          const SliverAppBar(
            title: Text("App Bar: Home Screen"),
            snap: true,
            floating: true,
          ),
        ],
        body: ListView(
          children: const [
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("TTTTWWWWW"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
            ListTile(
              title: Text("One"),
            ),
          ],
        ),
      ),
    );
  }
}
