import 'package:flutter/material.dart';

class BannerAdTopStaticWidget extends StatelessWidget {
  const BannerAdTopStaticWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          CardAdStatic(imageAsset: 'assets/images/home/top_ad/static01.jpeg'),
          CardAdStatic(imageAsset: 'assets/images/home/top_ad/static02.jpeg'),
        ],
    );
  }
}

class CardAdStatic extends StatelessWidget {
  final String imageAsset;

  const CardAdStatic({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        elevation: 2,
        child: Image.asset(
          imageAsset,
          // fit: BoxFit.fill,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
