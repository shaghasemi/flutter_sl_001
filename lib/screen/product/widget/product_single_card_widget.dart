import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/product/product_single_screen.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/src/extensions.dart';

class ProductSingleCardWidget extends StatelessWidget {
  final String id;
  final String title;
  final String image_logo;

  // final int quantity;
  final String seller_main;

  // final String seller_branch;
  final String price_original;
  final String? discount_percent;

  // final String? price_discount;
  // final String delivery_address;
  // final String delivery_date;

  const ProductSingleCardWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.image_logo,
    // required this.quantity,
    required this.seller_main,
    // required this.seller_branch,
    required this.price_original,
    this.discount_percent,
    // this.price_discount,
    // required this.delivery_address,
    // required this.delivery_date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductSingleScreen(product_id: id),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(4),
        elevation: 4,
        child: Container(
          // height: 200,
          width: 160,
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: 140,
                child: Image.network(
                  "${AppUrl.imageBaseUrl}"
                  "${image_logo}",
                ),
              ),
              Text(title),
              Text(seller_main),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(price_original.toPersianDigit().seRagham()),
                  Text(' ریال')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
