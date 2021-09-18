import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/main/cart_screen.dart';
import 'package:flutter_sl_001/screen/panel/logout_screen.dart';
import 'package:flutter_sl_001/screen/panel/widget/profile_section_go_to_widget.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileSectionGoToWidget(
          iconName: Icons.question_answer_outlined,
          title: "FAQ",
          destination: LogoutGlobalScreen(),
        ),
        ProfileSectionGoToWidget(
          iconName: Icons.privacy_tip_outlined,
          title: "Privacy",
          destination: LogoutGlobalScreen(),
        ),
        ProfileSectionGoToWidget(
          iconName: Icons.verified_user_outlined,
          title: "How to Use",
          destination: LogoutGlobalScreen(),
        ),
        ProfileSectionGoToWidget(
          iconName: Icons.contact_phone_outlined,
          title: "Contact Us",
          destination: LogoutGlobalScreen(),
        ),
        ProfileSectionGoToWidget(
          iconName: Icons.error_outline,
          title: "Submit Error",
          destination: LogoutGlobalScreen(),
        ),
        ProfileSectionGoToWidget(
          iconName: Icons.star_rate_outlined,
          title: "rate Us",
          destination: LogoutGlobalScreen(),
        ),
        // tapping logout shows snackbar
        ProfileSectionGoToWidget(
          iconName: Icons.logout_outlined,
          title: "Log Out",
          destination: LogoutGlobalScreen(),
        ),
      ],
    );
  }
}
