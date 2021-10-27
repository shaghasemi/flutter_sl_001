import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String? image;
  final String? productName;
  final String? salesType;
  final String? shopName;
  final String? branchName;
  final String? unit;
  final String? packing;
  final String? calculatingProperty;
  final int? discountSum;
  final int? payAmount;
  final String? deliveryAddress;
  final int? quantity;

  const OrderItemWidget({
    Key? key,
    /*required*/ this.image,
    /*required*/ this.productName,
    /*required*/ this.salesType,
    /*required*/ this.shopName,
    /*required*/ this.branchName,
    /*required*/ this.unit,
    this.packing,
    this.calculatingProperty,
    /*required*/ this.discountSum,
    /*required*/ this.payAmount,
    /*required*/ this.deliveryAddress,
    /*required*/ this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
          Container(
            height: 140,
            width: 140,
            child: Image.network('src'),
          ),
          Text(productName.toString()),
          Text(salesType.toString()),
          Text(shopName.toString()),
          Text(branchName.toString()),
          Text(unit.toString()),
          Text(packing.toString()),
          Text(calculatingProperty.toString()),
          Text(discountSum.toString()),
          Text(payAmount.toString()),
          Text(deliveryAddress.toString()),
          TextFormField(
            initialValue: quantity.toString(),
            decoration: InputDecoration(
              hintText: "order Quantity",
            ),
          ),
        ],
      ),
    );
  }
}
