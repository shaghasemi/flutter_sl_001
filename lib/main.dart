import 'package:flutter/material.dart';
import 'package:flutter_sl_001/provider_test/cart_model.dart';
import 'package:provider/provider.dart';
import 'app_home.dart';
import 'data/local/shared_pref.dart';
import 'model/cart/cart_product_list.dart';

void main() async {
  await UserPreferences.init(); // Initializing Shared Prefs throughout app
  runApp(const MyApp());
  /*runApp(
    ChangeNotifierProvider(
      create: (_) {
        CartProductTemp();
      },
      child: const MyApp(),
    ),
  );*/
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: const Color(0xff222222),
      ),*/
      title: 'سیوان لند',
      /*home: ChangeNotifierProvider(
        create: (BuildContext context) {
          CartModel();
        },
        child: AppHome(),
      ),*/
      // home: AppHome(),
      home: ChangeNotifierProvider(
        create: (_) => CartProductList(),
        child: AppHome(),
      ),
    );
  }
}
