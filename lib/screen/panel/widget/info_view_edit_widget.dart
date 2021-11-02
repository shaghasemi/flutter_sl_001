import 'package:flutter/material.dart';

class InfoViewEditWidget extends StatelessWidget {
  final String title;
  final String content;
  final Widget destination;

  const InfoViewEditWidget({
    required this.title,
    required this.content,
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
              Expanded(
                child: Column(
                  children: [
                    Text(title),
                    Text(content),
                  ],
                ),
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
