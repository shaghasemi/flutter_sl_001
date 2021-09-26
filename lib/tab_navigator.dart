import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/main/cart_screen.dart';
import 'package:flutter_sl_001/screen/main/category_screen.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:flutter_sl_001/screen/main/profile_screen.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.tabItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = const HomeScreen();

    if (tabItem == "Page1") {
      child = const HomeScreen();
    } else if (tabItem == "Page2") {
      child = const CartScreen();
    } else if (tabItem == "Page3") {
      child = const CategoryScreen();
    } else if (tabItem == "Page4") {
      child = const ProfileScreen();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
