import 'package:flutter/material.dart';
import '/tab_navigator.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String _currentPage = "Page1";
  List<String> pageKeys = [
    "Page1",
    "Page2",
    "Page3",
    "Page4",
  ];
  final _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        // Brings screen in focus upwards when keyboard appears
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            buildOffstageNavigator("Page1"),
            buildOffstageNavigator("Page2"),
            buildOffstageNavigator("Page3"),
            buildOffstageNavigator("Page4"),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.redAccent,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: "خانه",
              icon: Icon(Icons.home),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "سبد خرید",
              icon: Icon(Icons.shopping_cart),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "دسته بندی",
              icon: Icon(Icons.widgets ),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              label: "سیوان من",
              icon: Icon(Icons.person),
              backgroundColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
