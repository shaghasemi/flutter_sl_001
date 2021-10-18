import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/search/product_search.dart';

class SearchProvider extends ChangeNotifier {
  ProductSearchData _data = new ProductSearchData();

  ProductSearchData get getData => _data;

  void setData(ProductSearchData data) {
    _data = data;
    notifyListeners();
  }

  void removeData() {
    _data = ProductSearchData();
    notifyListeners();
  }
}
