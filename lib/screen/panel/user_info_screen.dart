import 'package:flutter/material.dart';

import 'user_info_edit_screen.dart';
import 'widget/info_view_edit_widget.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Column for orders, with row for different status
        Column(
          children: const [
            Text("User Info"),
            SizedBox(height: 50),
            InfoViewEditWidget(
              title: 'نام کاربر',
              destination: UserInfoScreenTemp(
                title: 'عنوان ویرایش',
                hint: 'متن داخل ویرایشگر',
                content: 'راهنما (اختیاری)',
              ),
              content: 'محتوای نام کاربر',
            ),
            InfoViewEditWidget(
              title: 'نام کاربر',
              destination: UserInfoScreenTemp(
                title: 'عنوان ویرایش',
                hint: 'متن داخل ویرایشگر',
                content: 'راهنما (اختیاری)',
              ),
              content: 'محتوای نام کاربر',
            ),
            InfoViewEditWidget(
              title: 'نام کاربر',
              destination: UserInfoScreenTemp(
                title: 'عنوان ویرایش',
                hint: 'متن داخل ویرایشگر',
                content: 'راهنما (اختیاری)',
              ),
              content: 'محتوای نام کاربر',
            ),
            InfoViewEditWidget(
              title: 'نام کاربر',
              destination: UserInfoScreenTemp(
                title: 'عنوان ویرایش',
                hint: 'متن داخل ویرایشگر',
                content: 'راهنما (اختیاری)',
              ),
              content: 'محتوای نام کاربر',
            ),
          ],
        ),
      ],
    );
  }
}
