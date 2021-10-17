import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/product/product_latest_model.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CallToActionWidget extends StatelessWidget {
  const CallToActionWidget({
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
          CardCTAStatic(
              imageAsset: 'assets/images/home/cta/afzodani_beton.png'),
          CardCTAStatic(
              imageAsset: 'assets/images/home/cta/forush_online_beton.png'),
          CardCTAStatic(imageAsset: 'assets/images/home/cta/masaleh.png'),
        ],
      ),
    );
  }
}

class CardCTAStatic extends StatelessWidget {
  final String imageAsset;

  const CardCTAStatic({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UnderConstructionScreen()),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .45,
        child: Card(
          elevation: 2,
          child: Image.asset(
            imageAsset,
            // fit: BoxFit.fill,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
