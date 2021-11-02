import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/screen/main/cart_screen.dart';
import 'package:flutter_sl_001/screen/panel/message_list_screen.dart';
import 'package:flutter_sl_001/screen/panel/order_screen.dart';
import 'package:flutter_sl_001/screen/panel/password_change_screen.dart';
import 'package:flutter_sl_001/screen/panel/user_info_screen_editable.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';
import 'package:flutter_sl_001/screen/panel/widget/order_by_status_widget.dart';
import 'package:provider/provider.dart';
import 'profile_settings_screen.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  late LoginResponseModel userInfo;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadUser();
  }

  @override
  Widget build(BuildContext context) {
    // Future<String?> getTokenString() => UserPreferences().getTokenAsync();
    // Future<LoginData> getUserData() => UserPreferences().getUserAsync();
    return Scaffold(
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.alarm),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageListScreen(),
                  ),
                );
              },
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
            // Column for user's name and number - personal info display
            const SizedBox(height: 20),
            Column(
              children: [
                Consumer<UserProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        Text(value.userData.mobile!),
                        if (value.userData.user_id != null &&
                            value.userData.user_id!.name != null)
                          Text(value.userData.user_id!.name!)
                      ],
                    );
                  },
                ),
              ],
            ),

            // Column for orders, with row for different status
            const SizedBox(height: 20),
            const OrderByStatusWidget(),
            // Various entries for panel
            const SizedBox(height: 20),
            Expanded(
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
                    title: 'سفارش ها',
                    iconName: Icons.shopping_bag,
                    destination: OrderScreen(),
                  ),
                  ProfileSectionGoToWidget(
                    title: 'اطلاعات کاربر',
                    iconName: Icons.person_outline,
                    // destination: UserInfoScreen(),
                    destination: UserInfoEditScreenUpdated(),
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
