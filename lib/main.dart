import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_home.dart';
import 'data/local/user_pref.dart';
import 'data/local/cart_pref.dart';
import 'data/provider/cart_provider.dart';
import 'data/provider/search_provider.dart';
import 'data/provider/user_provider.dart';

void main() async {
  await UserPreferences.init(); // Initializing User Prefs throughout app
  await CartPreferences.init(); // Initializing Cart Prefs throughout app
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<LoginData> getUserData() => UserPreferences().getUser();
    // Future<LoginData> getUserData() => UserPreferences().getUserasync();

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
          ChangeNotifierProvider(create: (_) => CartProvider()),
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
