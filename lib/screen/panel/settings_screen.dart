import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'entry/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _logoutDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (_) {
          return AlertDialog(
            buttonPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            title: SvgPicture.asset(
              'assets/svg/logo_sl_2.svg',
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('آیا می خواهید از حساب کاربری خارج شوید؟'),
                ],
              ),
            ),
            actions: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('بله'),
                      onPressed: () {
                        Provider.of<UserProvider>(context, listen: false)
                            .removeUser();
                        Provider.of<UserProvider>(context, listen: false)
                            .removeToken();
                        UserPreferences().removeUser();
                        Navigator.of(_).pop();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false,
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('خیر'),
                      onPressed: () {
                        Navigator.of(_).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        SliverAppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Vazir',
          ),
          title: Text("تنظیمات"),
          elevation: 8,
          snap: true,
          floating: true,
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            ProfileSectionGoToWidget(
              iconName: Icons.question_answer_outlined,
              title: "پرسش های متداول",
              destination: UnderConstructionScreen(),
            ),
            ProfileSectionGoToWidget(
              iconName: Icons.privacy_tip_outlined,
              title: "حریم خصوصی",
              destination: UnderConstructionScreen(),
            ),
            ProfileSectionGoToWidget(
              iconName: Icons.verified_user_outlined,
              title: "راهنمای استفاده",
              destination: UnderConstructionScreen(),
            ),
            ProfileSectionGoToWidget(
              iconName: Icons.contact_phone_outlined,
              title: "تماس با ما",
              destination: UnderConstructionScreen(),
            ),
            ProfileSectionGoToWidget(
              iconName: Icons.error_outline,
              title: "گزارش خطا",
              destination: UnderConstructionScreen(),
            ),
            ProfileSectionGoToWidget(
              iconName: Icons.star_rate_outlined,
              title: "امتیازدهی",
              destination: UnderConstructionScreen(),
            ),
            /*ProfileSectionGoToWidget(
              iconName: Icons.logout_outlined,
              title: "صفحه خروج",
              destination: LogoutGlobalScreen(),
            ),*/
            GestureDetector(
              onTap: () {
                _logoutDialog();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
                child: Row(
                  children: [
                    Icon(Icons.logout_outlined),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('خروج از حساب کاربری'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
