import 'package:flutter/material.dart';

class UserInfoMainWidget extends StatelessWidget {
  final String userName;
  final String userPhone;

  const UserInfoMainWidget({
    Key? key,
    required this.userName,
    required this.userPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userName),
        Text(userPhone),
      ],
    );
  }
}
