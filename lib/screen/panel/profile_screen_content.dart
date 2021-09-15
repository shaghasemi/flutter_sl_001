import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // A button at the top right will access: Settings Screen
                // 1. FAQ
                // 2. Contact Us
                // 3. Submit Error
                // 4. Rate Us
                // 5. Logout
                // 6. How to use
                // 7. Rights and ...
                // 8. Log Out
                Icon(Icons.alarm),
                Icon(Icons.settings),
              ],
            ),
            snap: true,
            floating: true,
          )
        ],
        body: Column(
          children: [
            // Column for user's name and number - personal info display
            Column(
              children: [
                Text("User's Name"),
                Text("User's Phone Number"),
              ],
            ),
            // Column for orders, with row for different status
            Column(
              children: [
                const Text("My Orders"),
                Row(
                  children: [
                    // Different boxes for orders
                    Column(
                      children: [
                        Image.asset('images/awaiting_payment.png'),
                        const Text("در انتظار پرداخت"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('images/processing.png'),
                        const Text("در حال پردازش"),
                      ],
                    ),
                  Column(
                      children: [
                        Image.asset('images/processing.png'),
                        const Text("ارسال شده"),
                      ],
                    ),
                  Column(
                      children: [
                        Image.asset('images/processing.png'),
                        const Text("تحویل شده"),
                      ],
                    ),
                  Column(
                      children: [
                        Image.asset('images/processing.png'),
                        const Text("مرجوعی"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            // Various entries for panel
            Column(
              children: const [
                // Favorites widget,
                // Comments Widget,
                // Addresses Widget,
                // User Info widget: This includes info updates
              ],
            ),
          ],
        ),
      ),
    );
  }
}
