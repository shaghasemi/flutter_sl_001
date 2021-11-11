import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/product/product_single_screen.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/src/extensions.dart';

class ProductItemWidget2 extends StatelessWidget {
  final String id;
  final String title;
  final String image_logo;
  final String seller_main;
  final String price_original;

  const ProductItemWidget2({
    Key? key,
    required this.id,
    required this.title,
    required this.image_logo,
    required this.seller_main,
    required this.price_original,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Card(
          elevation: 1,
          color: Colors.grey.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4, 0, 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        "${AppUrl.imageBaseUrl}${image_logo}",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        // textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        price_original.toPersianDigit().seRagham(),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        ' ریال',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
