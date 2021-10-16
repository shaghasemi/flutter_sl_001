import 'package:flutter/cupertino.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';

class CartModel extends ChangeNotifier {
  List<ProductSingleRequestModel> productList = [];

  addProductToList() {
    ProductSingleRequestModel productSingleRequestModel =
        ProductSingleRequestModel(
      // token: 'token crap 1',
      id: 'id crap 1',
    );
    productList.add(productSingleRequestModel);

    notifyListeners();
  }
}
