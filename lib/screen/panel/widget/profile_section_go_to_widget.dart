import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
      child: InkWell(
        child: Row(
          children: [
            Icon(iconName),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(title),
              ),
            ),
            const Icon(
              // Icons.arrow_forward,
              Icons.navigate_next,
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
    );
  }
}
