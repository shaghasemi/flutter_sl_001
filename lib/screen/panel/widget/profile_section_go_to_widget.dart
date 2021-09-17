import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/main/home_screen.dart';

class ProfileSectionGoToWidget extends StatelessWidget {
  final IconData iconName;
  final String title;
  final Widget destination;

  const ProfileSectionGoToWidget({
    required this.iconName,
    required this.title,
    required this.destination,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
        ),
        child: InkWell(
          child: Row(
            children: [
              Icon(iconName),
              Expanded(
                child: Text(title),
              ),
              const Icon(
                Icons.forward,
                color: Colors.grey,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => destination,
              ),
            );
          },
        ),
      ),
    );
  }
}
