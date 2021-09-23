import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/screen/main/cart_screen.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';
import 'package:flutter_sl_001/screen/panel/password_change_screen.dart';
import 'package:flutter_sl_001/screen/panel/user_info_screen_temp.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';
import 'package:flutter_sl_001/screen/panel/widget/order_by_status_widget.dart';
import 'profile_settings_screen.dart';
import 'user_info_screen.dart';
import 'widget/user_info_main_widget.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  late var userInfoRaw;
  late LoginResponseModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.alarm),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileSettingsScreen(),
                    ),
                  );
                },
              ),
            ],
            snap: true,
            floating: true,
          )
        ],
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    userInfoRaw = jsonDecode(
                      MySharedPreferences.mySharedPreferences
                          .getString("user_data")!,
                    );
                    print(userInfoRaw['data']);
                    print(userInfoRaw.runtimeType);
                    userInfo = jsonDecode(userInfoRaw);
                    print(userInfo);
                    print(userInfo.runtimeType);
                  });
                },
                child: Text("Check Data")),
            // Column for user's name and number - personal info display
            const SizedBox(height: 20),
            const UserInfoMainWidget(
              userName: 'User Name',
              userPhone: 'Phone Number',
            ),
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
                    title: 'علاقمندی',
                    iconName: Icons.favorite_border_outlined,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'نظرات',
                    iconName: Icons.comment,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'نشانی',
                    iconName: Icons.map,
                    destination: CartScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'اطلاعات کاربر',
                    iconName: Icons.person_outline,
                    // destination: UserInfoScreen(),
                    destination: UserInfoScreenTemp(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'تغییر رمز عبور',
                    iconName: Icons.lock,
                    // destination: UserInfoScreen(),
                    destination: ChangePasswordScreen(),
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
