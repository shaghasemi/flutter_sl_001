import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/provider_test/search_provider.dart';
import 'package:flutter_sl_001/provider_test/user_provider.dart';
import 'package:provider/provider.dart';
import 'app_home.dart';
import 'data/local/shared_pref.dart';
import 'provider_test/cart_product_list.dart';

void main() async {
  await UserPreferences.init(); // Initializing Shared Prefs throughout app
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<LoginData> getUserData() => UserPreferences().getUser();

    return MaterialApp(
      locale: Locale("IR", "fa"),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: const Color(0xff5fd961),
      ),
      title: 'سیوان لند',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartOrderList()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => SearchProvider())
        ],
        child: AppHome(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
