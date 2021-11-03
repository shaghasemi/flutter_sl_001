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
        // colorScheme: ColorScheme.light(),
        // colorScheme: ColorScheme.dark(),
        // primaryColor: const Color(0xff5fd961),
        // primaryColor: const Color(0xff7cb721),
        // cardColor: const Color(0xffE8E8E8),
        primarySwatch: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) return Colors.red;
                return null                   ; // Defer to the widget's default.
              },
            ),
            shadowColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) return Colors.pink;
                return Colors.black; // Defer to the widget's default.
              },
            ),
          ),
        ),
        // primaryTextTheme: ,ButtonStyle(co)
        // cardColor: const Color(0xff7cb721),
        // brightness: Brightness.dark,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Vazir'),
        ),
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
