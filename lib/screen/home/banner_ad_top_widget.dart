import 'package:flutter/material.dart';

class BannerAdTopWidget extends StatelessWidget {
  const BannerAdTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(initialScrollOffset: 140),
      reverse: true,
      child: Row(
        children: [
          CardShop(imageAsset: 'assets/images/home/top_ad/slider/h1.jpeg'),
          CardShop(imageAsset: 'assets/images/home/top_ad/slider/h2.jpeg'),
          CardShop(imageAsset: 'assets/images/home/top_ad/slider/h3.jpeg'),
          CardShop(imageAsset: 'assets/images/home/top_ad/slider/h4.jpeg')
        ],
      ),
    );
  }
}

class CardShop extends StatelessWidget {
  final String imageAsset;

  const CardShop({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width*.85,
        child: Image.asset(
          imageAsset,
          // fit: BoxFit.fill,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
