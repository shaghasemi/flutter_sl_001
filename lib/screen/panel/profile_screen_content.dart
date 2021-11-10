import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/panel/message/message_list_screen.dart';
import 'package:flutter_sl_001/screen/panel/order/order_screen.dart';
import 'package:flutter_sl_001/screen/panel/password_change_screen.dart';
import 'package:flutter_sl_001/screen/panel/user_info_screen_editable.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';
import 'package:flutter_sl_001/screen/panel/widget/order_by_status_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'settings_screen.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({Key? key}) : super(key: key);

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  late LoginResponseModel userInfo;
  bool _isApiCallProcess = false;
  APIServicePanel apiService = APIServicePanel();
  UserInfoRequestModel userInfoRequestModel = UserInfoRequestModel(token: '');
  String tokenPref = '';

  @override
  void initState() {
    super.initState();
    // UserProvider().loadUser();
    // tokenPref = UserPreferences().getToken();
    print("tokenPref");
    print(tokenPref);
    fetchUserInfo(tokenPref);

    // This is currently used to display user name and phone number on top of the page
    Provider.of<UserProvider>(context, listen: false).loadUser();
  }

  @override
  Widget build(BuildContext context) {
    // Future<String?> getTokenString() => UserPreferences().getTokenAsync();
    // Future<LoginData> getUserData() => UserPreferences().getUserAsync();
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Vazir',
            ),
            title: Text("حساب کاربری"),
            snap: true,
            centerTitle: true,
            floating: true,
            leading: IconButton(
              icon: const Icon(Icons.message),
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
                      builder: (context) => const SettingsScreen(),
                    ),
                  );
                },
              ),
            ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,8,16,4),
                              child: SizedBox(
                                height: 72,
                                width: 72,
                                // child: Image.network('src'),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  // child: Image.asset(name),
                                  child: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/panel/avatar_1.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (value.userData.user_id != null &&
                                      value.userData.user_id!.name != null)
                                    Text(
                                      value.userData.user_id!.name!,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  Text(
                                    value.userData.mobile!,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Column for orders, with row for different status
                        const SizedBox(height: 20),
                        const OrderByStatusWidget(),
                        // Various entries for panel
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            ProfileSectionGoToWidget(
                              title: 'علاقمندی',
                              iconName: Icons.favorite_border_outlined,
                              destination: UnderConstructionScreen(),
                            ),
                            ProfileSectionGoToWidget(
                              title: 'نظرات',
                              iconName: Icons.comment,
                              destination: UnderConstructionScreen(),
                            ),
                            ProfileSectionGoToWidget(
                              title: 'سفارش ها',
                              iconName: Icons.shopping_bag,
                              destination: OrderScreen(),
                            ),
                            ProfileSectionGoToWidget(
                              title: 'مشخصات کاربر',
                              iconName: Icons.person_outline,
                              // destination: UserInfoScreen(),
                              destination: UserInfoEditScreenUpdated(
                                  userInfoInput: value.userData),
                            ),
                            ProfileSectionGoToWidget(
                              title: 'تغییر رمز عبور',
                              iconName: Icons.lock,
                              // destination: UserInfoScreen(),
                              destination: ChangePasswordScreen(
                                phoneNumberInput: value.userData.mobile!,
                                tokenInput: value.userData.token!,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  fetchUserInfo(String token) {
    userInfoRequestModel.token = token;
    print("Fetch 1");
    print(jsonEncode(userInfoRequestModel));
    setState(() {
      _isApiCallProcess = true;
    });
    apiService.userInfo(userInfoRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );

        print("Fetch 2");
        print(jsonEncode(value));
        // Provider.of<UserProvider>(context, listen: false).setUser(userInfoEditRequestModel);
      },
    ).onError(
      (error, stackTrace) {
        print("OnError: $error");
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        setState(
          () {
            _isApiCallProcess = false;
          },
        );
      },
    );
  }
}
