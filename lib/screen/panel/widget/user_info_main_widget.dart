import 'package:flutter/material.dart';

class UserInfoMainWidget extends StatelessWidget {
  const UserInfoMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("User's Name"),
        Text("User's Phone Number"),
      ],
    );
  }
}
