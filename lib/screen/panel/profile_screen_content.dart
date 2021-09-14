import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Profile Screen Content"),
          ElevatedButton(
            onPressed: () {
              MySharedPreferences.myShrdPref.clear();
              Navigator.pop(context); // problematic
            },
            child: const Text("Log Out"),
          )
        ],
      ),
    );
  }
}
