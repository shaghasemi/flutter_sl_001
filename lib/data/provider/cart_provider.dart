import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/cart_pref.dart';
import 'package:flutter_sl_001/model/order/processing_response_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      toast(message: 'محصول به سبد خرید اضافه شد');
    } else if (orderItem.order!.packId != null &&
        orderItem.order!.selectedPropertyIdList![0].propertyId != null) {
      repeatOrder = sameProductOrderData
          .where((e) =>
              e.order!.packId == orderItem.order!.packId &&
              e.order!.selectedPropertyIdList![0].partId ==
                  orderItem.order!.selectedPropertyIdList![0].partId)
          .toList();
      toast(message: 'محصول با این ویژگی ها در سبد خرید موجود است');
      if (repeatOrder.length == 0) {
        addOK();
        toast(message: 'محصول به سبد خرید اضافه شد');
      } else {}
    } else if (orderItem.order!.packId != null) {
      if (samePackingOrderData.length == 0) {
        addOK();
        toast(message: 'محصول به سبد خرید اضافه شد');
      } else {}
    } else if (orderItem.order!.selectedPropertyIdList![0].propertyId != null) {
      if (samePropertyOrderData.length == 0) {
        addOK();
        toast(message: 'محصول به سبد خرید اضافه شد');
      } else {
        toast(message: 'محصول با این ویژگی ها در سبد خرید موجود است');
      }
    }
  }

  updateOrder(int index, ProcessingResponseData updatedData) {
    print("CartProvider Update Called");
    processingList[index] = updatedData;
    CartPreferences().saveCart(processingList);
    notifyListeners();
  }

  loadOrder() {
    print("CartProvider Load Called");
    Future<List<ProcessingResponseData>> getData() =>
        CartPreferences().loadCart();
    getData().then(
      (value) {
        processingList = value;
        notifyListeners();
      },
    );
  }

  // TODO: Fix order number on remove
  removeOrder(int index) {
    processingList.removeAt(index);
    CartPreferences().saveCart(processingList);
    print("Removed Order from Cart");
    notifyListeners();
  }

  clearCart() {
    processingList = [];
    CartPreferences().saveCart(processingList);
    print("Cleared Cart: ${jsonEncode(processingList)}");
    notifyListeners();
  }

  void toast({required String message, bool? long}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: long == true ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // fontSize: 16.0,
    );
  }
}
