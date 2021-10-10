import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/cart/cart_product_list.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';
import 'package:provider/provider.dart';

class CartContent extends StatefulWidget {
  const CartContent({Key? key}) : super(key: key);

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  // late List<Data> orderListInfo;

  @override
  Widget build(BuildContext context) {
    // orderListInfo = [];
    return Consumer<CartProductList>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.productList.length,
          itemBuilder: (context, index) {
            // return Text(value.productList[index].id!);
            return ProductListOrderWidget(
              price_original:
                  value.productList[index].price ?? 'Price (PlaceHolder)',
              // price_original: '',
              quantity: value.productList[index].likes ?? 1024,
              seller_branch: value.productList[index].branchId ??
                  'Seller Branch (PlaceHolder)',
              delivery_address: value.productList[index].description ??
                  'Delivery Address (PlaceHolder)',
              image_logo: value.productList[index].imageList![0],
              seller_main: value.productList[index].shopId ??
                  'Seller Main (PlaceHolder)',
              // title: orderListInfo[index].productId ?? 'Price (PlaceHolder)',
              title: value.productList[index].titleFa ?? 'Title (PlaceHolder)',
              delivery_date: value.productList[index].createdAt ??
                  'Delivery Date (PlaceHolder)',
            );
          },
        );
      },
    );
  }

  void fetchProductInfo() {}
}
