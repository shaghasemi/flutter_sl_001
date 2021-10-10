import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_product.dart';
import 'package:flutter_sl_001/model/product/product_single_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';

class ProductFullScreenWidget extends StatefulWidget {
  final String token;
  final String product_id;

  const ProductFullScreenWidget({
    Key? key,
    required this.product_id,
    required this.token,
  }) : super(key: key);

  @override
  State<ProductFullScreenWidget> createState() =>
      _ProductFullScreenWidgetState();
}

class _ProductFullScreenWidgetState extends State<ProductFullScreenWidget> {
  late ProductSingleRequestModel productSingleRequestModel;
  late ProductSingleData productInfo;
  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    fetchProductById();
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
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        const SliverAppBar(
          title: Text(
            "نام محصول - دینامیک",
            style: TextStyle(
                // color: Color(0xff28a745),
                fontWeight: FontWeight.bold,
                fontFamily: 'Vazir'),
          ),
          backgroundColor: Color(0xff28a745),
          snap: true,
          centerTitle: true,
          floating: true,
        ),
      ],
      body: SingleChildScrollView(
        // physics: ScrollPhysics(),
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.asset("assets/images/awaiting_payment.png"),
            Text("Product Page"),
            Text(productInfo.titleFa!),
            Text(productInfo.likes.toString()),
            Text(productInfo.supporting.toString()),
            Text(productInfo.unit.toString()),
          ],
        ),
      ),
    );
  }

  void fetchProductById() {
    ApiServiceProduct apiServiceCategory = ApiServiceProduct();
    productSingleRequestModel =
        ProductSingleRequestModel(token: widget.token, id: widget.product_id);
    apiServiceCategory.productSingle(productSingleRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      print(value.message);
      if (value.status == 200) {
        productInfo = value.data!;
      }
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }

  void addToCart(){}
}
