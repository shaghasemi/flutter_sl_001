import 'package:flutter/material.dart';

class BannerShopSliderWidget extends StatelessWidget {
  const BannerShopSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        CardShop(imageAsset: 'assets/images/home/banner_shop/banner1.jpeg'),
        CardShop(imageAsset: 'assets/images/home/banner_shop/banner2.jpeg'),
        CardShop(imageAsset: 'assets/images/home/banner_shop/banner3.jpeg'),
        CardShop(imageAsset: 'assets/images/home/banner_shop/banner4.jpeg'),
        CardShop(imageAsset: 'assets/images/home/banner_shop/banner5.jpeg'),
      ],
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Image.asset(imageAsset),
      ),
    );
  }
}
