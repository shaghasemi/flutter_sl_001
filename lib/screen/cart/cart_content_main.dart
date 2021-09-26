import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/order/order_all_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/product/widget/product_order_list_widget.dart';

class CartContent extends StatefulWidget {
  final String token;

  const CartContent({Key? key, required this.token}) : super(key: key);

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  APIService apiService = APIService();
  late OrderAllRequestModel orderAllRequestModel; //late
  bool isApiCallProcess = false;
  bool loginState = false;
  late List<Data> orderListInfo;
  bool _isApiCallProcess = true;

  @override
  void initState() {
    super.initState();
    orderAllRequestModel = OrderAllRequestModel(token: '');
    // orderListInfo = List as List<Data>;
    orderListInfo = [];
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    orderAllRequestModel.token = widget.token;
    // print(orderAllRequestModel.token);
    apiService.orderAll(orderAllRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        print("Requested order list");
        if (value.status == 200) {
          print(value.toJson());
          orderListInfo = value.data!;
          MySharedPreferences.mySharedPreferences.setString(
            "order_data",
            value.data!.toString(),
          );
        }
      },
    );
    // return Text("Waiting on Result from Order Collection");
    return ListView.builder(
      itemCount: orderListInfo.length,
      itemBuilder: (context, index) {
        return ProductListOrderWidget(
          price_original:
              orderListInfo[index].otherPrice ?? 'Price (PlaceHolder)',
          // price_original: '',
          quantity: orderListInfo[index].number ?? 1024,
          seller_branch:
              orderListInfo[index].branchId ?? 'Branch (PlaceHolder)',
          delivery_address:
              orderListInfo[index].address ?? 'Price (PlaceHolder)',
          image_logo: 'assets/images/processing.png',
          seller_main:
              orderListInfo[index].province!.name ?? 'Price (PlaceHolder)',
          title: orderListInfo[index].productId ?? 'Price (PlaceHolder)',
          delivery_date:
              orderListInfo[index].createdAt ?? 'Price (PlaceHolder)',
        );
      },
    );
  }
}
