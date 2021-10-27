import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';

class CartOrderList extends ChangeNotifier {
  List<ProcessingResponseData> processingList = [];

  addOrderToCart(ProcessingResponseData orderItem) {
    processingList.add(orderItem);
    notifyListeners();
  }

  // TODO
  updateOrder(){
    notifyListeners();
  }

  // TODO
  RemoveOrder(id){
    notifyListeners();
  }

  clearCart(){
    processingList=[];
    notifyListeners();
  }
}
