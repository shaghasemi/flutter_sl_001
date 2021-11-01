import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/cart_pref.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:flutter_sl_001/model/product/product_single_model_old.dart';

class CartProvider extends ChangeNotifier {
  List<ProcessingResponseData> processingList = [];
  List<ProcessingResponseData> sameProductOrderData = [];
  List<ProcessingResponseData> samePackingOrderData = [];
  List<ProcessingResponseData> samePropertyOrderData = [];
  List<ProcessingResponseData> repeatOrder = [];

  addOrderToCart(ProcessingResponseData orderItem) {
    void addOK() {
      print("CartProvider Add Called");
      processingList.add(orderItem);
      CartPreferences().saveCart(processingList);
      print("Added to Cart");
      print(processingList.length);
      for (int i = 0; i < processingList.length; i++) {
        print(jsonEncode(processingList[i]));
      }
      notifyListeners();
    }

    sameProductOrderData = processingList
        .where((e) => e.order!.id == orderItem.order!.id)
        .toList();
    samePackingOrderData = sameProductOrderData
        .where((e) => e.order!.packId == orderItem.order!.packId)
        .toList();
    samePropertyOrderData = sameProductOrderData
        .where((e) =>
            e.order!.selectedPropertyIdList![0].partId ==
            orderItem.order!.selectedPropertyIdList![0].partId)
        .toList();

    if (sameProductOrderData.length == 0) {
      addOK();
    } else if (orderItem.order!.packId != null &&
        orderItem.order!.selectedPropertyIdList![0].propertyId != null) {
      repeatOrder = sameProductOrderData
          .where((e) =>
              e.order!.packId == orderItem.order!.packId &&
              e.order!.selectedPropertyIdList![0].partId ==
                  orderItem.order!.selectedPropertyIdList![0].partId)
          .toList();
      if (repeatOrder.length == 0) {
        addOK();
      } else {}
    } else if (orderItem.order!.packId != null) {
      if (samePackingOrderData.length == 0) {
        addOK();
      } else {}
    } else if (orderItem.order!.selectedPropertyIdList![0].propertyId != null) {
      if (samePropertyOrderData.length == 0) {
        addOK();
      } else {}
    }
  }

  updateOrder(int index, ProcessingResponseData updatedData) {
    print("CartProvider Update Called");
    processingList[index] = updatedData;
    CartPreferences().saveCart(processingList);
    print("Updated Cart");
    for (int i = 0; i < processingList.length; i++) {
      print(jsonEncode(processingList[i]));
    }
    notifyListeners();
  }

  loadOrder() {
    print("CartProvider Load Called");
    Future<List<ProcessingResponseData>> getData() =>
        CartPreferences().loadCart();
    getData().then(
      (value) {
        processingList = value;
        print("loaded Cart");
        for (int i = 0; i < processingList.length; i++) {
          print(jsonEncode(processingList[i]));
        }
        notifyListeners();
      },
    );
  }

  // TODO: Fix order number on remove
  removeOrder(int index) {
    processingList.removeAt(index);
    CartPreferences().saveCart(processingList);
    print("Removed Order from Cart");
    print(jsonEncode(processingList));
    notifyListeners();
  }

  clearCart() {
    processingList = [];
    CartPreferences().saveCart(processingList);
    print("Cleared Cart");
    print(jsonEncode(processingList));
    notifyListeners();
  }
}
