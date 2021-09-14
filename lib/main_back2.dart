/*
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/mySharedPref.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'screen/main/cart_screen.dart';
import 'screen/main/feed_screen.dart';
import 'screen/main/profile_screen.dart';

void main() async {
  await MySharedPreferences.init(); // Initializing Shared Prefs throughout app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CartScreen(),
    const FeedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sivan Land 0.01"),
        ),
        // body: screens[currentIndex],
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.redAccent,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_cart),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "Feed",
              icon: Icon(Icons.feed),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
              backgroundColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
*/
