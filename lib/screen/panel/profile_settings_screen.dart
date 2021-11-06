import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/screen/panel/logout_screen.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        SliverAppBar(
          centerTitle: true,
          title: Text("تنظیمات"),
          elevation: 8,
          snap: true,
          floating: true,
        )
      ],
      body: Expanded(
        child: Column(
          children: const [
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
            // tapping logout shows snackbar
            ProfileSectionGoToWidget(
              iconName: Icons.logout_outlined,
              title: "خروج از حساب کاربری",
              destination: LogoutGlobalScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
