import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';

class CartProductList extends ChangeNotifier {
  List<ProductSingleData> productList = [];

  addProductToCart({required String id}) {
    ProductSingleData productItem = ProductSingleData(id: id);
    productList.add(productItem);

    notifyListeners();
  }
}
