import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/tab_navigator.dart';

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
  String _currentPage = "Page1";

  // int currentIndex;
  List<String> pageKeys = [
    "Page1",
    "Page2",
    "Page3",
    "Page4",
  ];
  int _selectedIndex = 0;

  final _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
  };

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
            await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Sivan Land 0.01"),
          ),
          // body: screens[currentIndex],
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator("Page1"),
              _buildOffstageNavigator("Page2"),
              _buildOffstageNavigator("Page3"),
              _buildOffstageNavigator("Page4"),
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
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        // navigatorKey:  GlobalKey<NavigatorState>() "Page1",
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
