import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({bool? shouldRebuild = false, Key? key})
      : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}
