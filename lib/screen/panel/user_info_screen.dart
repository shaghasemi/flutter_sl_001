import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          // Column for user's name and number - personal info display
          Column(),
          // Column for orders, with row for different status
          Column(
            children: [
              const Text("My Orders"),
              Row(
                children: [
                  // Different boxes for orders
                ],
              ),
            ],
          ),
          // Various entries for panel
          Column(
            children: [
              // Favorites widget,
              // Comments Widget,
              // Addresses Widget,
              // User Info widget: This includes info updates
            ],
          ),
        ],
      ),
    );
  }
}
