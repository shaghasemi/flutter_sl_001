import 'package:flutter/material.dart';

class UserInfoEditScreen extends StatelessWidget {
  final String title;
  final String content;
  final String hint;

  const UserInfoEditScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        TextFormField(
          decoration: InputDecoration(
            hintText: content,
          ),
        ),
        Text(hint),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('تایید اطلاعات'),
        ),
      ],
    );
  }
}
