import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/main/cart_screen.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';
import 'package:flutter_sl_001/screen/panel/widget/order_by_status_widget.dart';
import 'profile_settings_screen.dart';
import 'user_info_screen.dart';
import 'widget/user_info_main_widget.dart';

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
              children: [
                Icon(Icons.alarm),
                InkWell(
                  child: const Icon(Icons.settings),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileSettingsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            snap: true,
            floating: true,
          )
        ],
        body: Column(
          children: [
            // Column for user's name and number - personal info display
            const SizedBox(height: 20),
            const UserInfoMainWidget(),
            // Column for orders, with row for different status
            const SizedBox(height: 20),
            const OrderByStatusWidget(),

            // Various entries for panel
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  ProfileSectionGoToWidget(
                    title: 'Favorites',
                    iconName: Icons.favorite_border_outlined,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'Comments',
                    iconName: Icons.comment,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'Address List',
                    iconName: Icons.pattern_sharp,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'User Info',
                    iconName: Icons.person_outline,
                    destination: UserInfoScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
