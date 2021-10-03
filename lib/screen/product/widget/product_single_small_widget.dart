import 'package:flutter/material.dart';

class ProductSingleSmallWidget extends StatelessWidget {
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

  const ProductSingleSmallWidget({
    Key? key,
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
    return Center(
      child: Center(
        child: Column(
          children: [
            Text(title),
            // Text("Product Title"),
            Center(
              child: Row(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(image_logo),
                        // Text(quantity.toString()),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(seller_main),
                        // Text(seller_branch),
                        Text(price_original),
                        Text(discount_percent ?? ''),
                        // Text(price_discount ?? ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Center(child: Text(delivery_address)),
            // Center(child: Text(delivery_date)),
          ],
        ),
      ),
    );
  }
}
