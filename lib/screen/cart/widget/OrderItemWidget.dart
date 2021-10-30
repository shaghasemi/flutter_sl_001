import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/provider_test/cart_provider.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatefulWidget {
  final ProcessingResponseOrder customOrder;
  final int index;
  final String? productId;
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
  final int quantity;

  const OrderItemWidget({
    Key? key,
    required this.customOrder,
    required this.index,
    /*required*/ this.productId,
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
    required this.quantity,
  }) : super(key: key);

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();

  // ProcessingRequestModel processingRequestModel = ProcessingRequestModel(orderList: );
  late ProcessingRequestModel processingRequestModel;
  late ProcessingRequestOrderList processingRequestOrderList;
  late ProcessingRequestSelectedPropertyIdList
      processingRequestSelectedPropertyIdList;
  ProcessingResponseData processingData = ProcessingResponseData();
  int price = 0;
  late int quantity /*= 0*/;

  // int price = payAmount;

  @override
  void initState() {
    super.initState();

    // Passing order arguments from processing response in last step
    // to processing request in order to update price based on quantity
    ProcessingResponseData processingData = ProcessingResponseData();
    processingRequestModel = ProcessingRequestModel(
      orderList: [
        ProcessingRequestOrderList(
          packId: widget.customOrder.packId,
          address: widget.customOrder.address,
          city: widget.customOrder.city,
          province: widget.customOrder.province,
          number: widget.customOrder.number,
          id: widget.customOrder.id,
          lat: widget.customOrder.lat,
          lon: widget.customOrder.lon,
        ),
      ],
    );
    processingRequestModel.orderList[0].selectedPropertyIdList = [
      ProcessingRequestSelectedPropertyIdList()
    ];
    if (widget.customOrder.selectedPropertyIdList == null ||
        widget.customOrder.selectedPropertyIdList!.length != 0) {
      processingRequestModel
              .orderList[0].selectedPropertyIdList![0].propertyName =
          widget.customOrder.selectedPropertyIdList![0].propertyName;
      processingRequestModel
              .orderList[0].selectedPropertyIdList![0].propertyId =
          widget.customOrder.selectedPropertyIdList![0].propertyId;
      processingRequestModel.orderList[0].selectedPropertyIdList![0].partId =
          widget.customOrder.selectedPropertyIdList![0].partId;
    }
    price = widget.payAmount!;
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeOrder(widget.index);
            },
          ),
          Container(
            height: 140,
            width: 140,
            // child: Image.network(widget.image.toString()),
          ),
          Text(widget.productName.toString()),
          Text(widget.salesType.toString()),
          Text(widget.shopName.toString()),
          Text(widget.branchName.toString()),
          Text(widget.unit.toString()),
          Text(widget.packing.toString()),
          Text(widget.calculatingProperty.toString()),
          Text(widget.discountSum.toString()),
          // Text(widget.payAmount.toString()),
          Text(price.toString()),
          Text(widget.deliveryAddress.toString()),
          Text(quantity.toString()),
          /*TextFormField(
            initialValue: quantity.toString(),
            keyboardType: TextInputType.number,
            onChanged: (input) {
              processingRequestModel.orderList[0].number = int.parse(input);
              getPrice();
            },
            decoration: InputDecoration(
              icon: Icon(Icons.tag),
              hintText: "order Quantity",
            ),
          ),*/
        ],
      ),
    );
  }

  // To update the price when changing order quantity
  void getPrice() {
    apiServiceOrder.processing(processingRequestModel).then((value) {
      /*Provider.of<CartOrderList>(context, listen: false)
          .updateOrder(widget.index, value.data![0]);*/
      setState(() {
        Provider.of<CartProvider>(context, listen: false)
            .updateOrder(widget.index, value.data![0]);
        price = value.data![0].calculated!.total!;
        quantity = processingRequestModel.orderList[0].number!;
      });
      /*setState(() {
        price = value.data![0].calculated!.total!;
        // processingData = value.data![0];
      });*/
    });
  }
}
