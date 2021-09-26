import 'package:flutter/material.dart';

class RequestLoginScreen extends StatelessWidget {
  const RequestLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Image.asset('assets/images/under_construction.png'),
          // const SizedBox(height: 40),
          Text(
            'برای استفاده از تمامی خدمات، لطفا وارد حساب کاربری خود شوید',
            style: TextStyle(fontFamily: 'Vazir'),
          ),
        ],
      ),
    );
  }
}
