import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';

class CartProductTemp extends ChangeNotifier {
  List<Data> productList = [];

  addProductToCart({required String id}) {
    Data productItem = Data(id: id);
    productList.add(productItem);

    notifyListeners();
  }
}
