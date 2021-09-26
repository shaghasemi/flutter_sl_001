import 'package:flutter/material.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/under_construction.png'),
          const SizedBox(height: 40),
          const Text(
            'این صفحه در حال راه اندازی است',
            style: TextStyle(fontFamily: 'Vazir'),
          ),
        ],
      ),
    );
  }
}
