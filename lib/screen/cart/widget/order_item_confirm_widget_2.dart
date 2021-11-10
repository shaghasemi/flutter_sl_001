import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_sl_001/api/api_service_order.dart';
import 'package:flutter_sl_001/data/provider/cart_provider.dart';
import 'package:flutter_sl_001/model/order/processing_request_model.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/util/app_url.dart';
import 'package:persian_number_utility/src/extensions.dart';
import 'package:provider/provider.dart';

class OrderItemConfirmWidget2 extends StatefulWidget {
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
  final String? calculatingPropertyUnit;
  final int? discountSum;
  final int? payAmount;
  final String? deliveryAddress;
  final int quantity;

  const OrderItemConfirmWidget2({
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
    this.calculatingPropertyUnit,
    /*required*/ this.discountSum,
    /*required*/ this.payAmount,
    /*required*/ this.deliveryAddress,
    required this.quantity,
  }) : super(key: key);

  @override
  State<OrderItemConfirmWidget2> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemConfirmWidget2> {
  ApiServiceOrder apiServiceOrder = ApiServiceOrder();
  TextEditingController _textControllerQuantity = TextEditingController();

  // ProcessingRequestModel processingRequestModel = ProcessingRequestModel(orderList: );
  late ProcessingRequestModel processingRequestModel;
  late ProcessingRequestOrderList processingRequestOrderList;
  late ProcessingRequestSelectedPropertyIdList
      processingRequestSelectedPropertyIdList;
  ProcessingResponseData processingData = ProcessingResponseData();
  int price = 0;
  late int quantity;

  @override
  void initState() {
    super.initState();
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
    _textControllerQuantity.text = widget.quantity.toString();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
        child: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                      child: Text(
                        widget.productName.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: null,
                        softWrap: true,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Column(
                        children: [
                          widget.discountSum! > 0
                              ? Row(
                                  children: [
                                    Text(
                                      widget.discountSum.toString(),
                                      maxLines: null,
                                      softWrap: true,
                                    ),
                                    Text(
                                      ' درصد تخفیف',
                                      maxLines: null,
                                      softWrap: true,
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          // Text(widget.payAmount.toString()),
                          Row(
                            children: [
                              Text(
                                price.toString().toPersianDigit().seRagham(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold
                                    // color: Colors.green
                                    ),
                                maxLines: null,
                                softWrap: true,
                              ),
                              Text(
                                ' ریال',
                                maxLines: null,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      child: Image.network(
                        "${AppUrl.imageBaseUrl}"
                        "${widget.image}",
                        height: 130,
                        width: 130,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.storefront,
                                color: Colors.green,
                                size: 20,
                              ),
                              Flexible(
                                child: Text(
                                  ' شعبه: ${widget.branchName}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  // maxLines: null,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.storefront,
                                color: Colors.green,
                                size: 20,
                              ),
                              Flexible(
                                child: Text(
                                  ' واحد: ${widget.unit}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          widget.packing != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.storefront,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    Flexible(
                                      child: Text(
                                        ' بسته بندی: ${widget.packing}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.storefront,
                                color: Colors.green,
                                size: 20,
                              ),
                              Flexible(
                                child: Text(
                                  ' تعداد: ${widget.quantity}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          widget.calculatingProperty != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.storefront,
                                      color: Colors.green,
                                      size: 20,
                                    ),
                                    //TODO: Calculating Property Name
                                    Flexible(
                                      child: Text(
                                        ' ${widget.calculatingPropertyUnit}: ${widget.calculatingProperty}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w200,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.directions,
                                color: Colors.green,
                                size: 20,
                              ),
                              Flexible(
                                child: Text(
                                  ' نشانی: ${widget.deliveryAddress}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // To update price when changing order quantity
  void getPrice() {
    apiServiceOrder.processing(processingRequestModel).then((value) {
      setState(() {
        Provider.of<CartProvider>(context, listen: false)
            .updateOrder(widget.index, value.data![0]);
        price = value.data![0].calculated!.total!;
        quantity = processingRequestModel.orderList[0].number!;
      });
    });
  }
}
