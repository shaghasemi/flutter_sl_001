import 'package:flutter/material.dart';

class ProductScreenTemp extends StatelessWidget {
  final String id;

  const ProductScreenTemp({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(id.toString() /*?? "Product ID"*/),
      ),
    );
  }
}
