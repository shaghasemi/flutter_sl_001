/*
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sl_001/data/local/mySharedPref.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'screen/main/cart_screen.dart';
import 'screen/main/feed_screen.dart';
import 'screen/main/profile_screen.dart';

void main() async {
  await MySharedPreferences.init(); // Initializing Shared Prefs throughout app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const CartScreen(),
    const FeedScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Sivan Land (cupertino)",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: FeedScreen(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: FeedScreen(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: FeedScreen(),
                );
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProfileScreen(),
                );
              },
            );
            break;
          default:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: HomeScreen(),
                );
              },
            );
        }
      },
    );
  }
}
*/
