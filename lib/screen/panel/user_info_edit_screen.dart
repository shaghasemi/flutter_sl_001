import 'package:flutter/material.dart';

class UserInfoScreenTemp extends StatelessWidget {
  final String? title;
  final String? content;
  final String? hint;

  const UserInfoScreenTemp({
    Key? key,
    this.title,
    this.content,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title ?? "Title"),
        Text("Before TextField"),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint ?? "Hint ",
          ),
        ),
        Text("After TextField"),
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
