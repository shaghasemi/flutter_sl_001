import 'package:flutter/material.dart';

class ProductHorizontalScrollerMinimal extends StatelessWidget {
  const ProductHorizontalScrollerMinimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 35,
          itemBuilder: (context, index) {
            return Icon(Icons.gpp_good); //  This is supposed to return an image of the product
          },
        ),
      ),
    );
  }
}
