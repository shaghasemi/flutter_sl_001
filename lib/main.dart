import 'package:flutter/material.dart';
import 'app_home.dart';
import 'data/local/my_shared_pref.dart';

void main() async {
  await MySharedPreferences.init(); // Initializing Shared Prefs throughout app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: const Color(0xff222222),
      ),*/
      title: 'سیوان لند',
      home: AppHome(),
    );
  }
}
