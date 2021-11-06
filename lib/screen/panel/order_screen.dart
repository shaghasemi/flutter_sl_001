import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/panel/panel_order_model.dart';
import 'package:flutter_sl_001/model/panel/payment_init_model.dart';
import 'package:flutter_sl_001/screen/panel/order/payment_webview.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  APIServicePanel apiServicePanel = APIServicePanel();
  PanelOrderRequestModel panelOrderRequestModel =
      PanelOrderRequestModel(token: '', page: 1, limit: 100);
  PaymentInitRequestModel paymentInitRequestModel = PaymentInitRequestModel();
  late PanelOrderResponseData orderData;
  late String token;
  String bankUrl = '';

  // String urlBase = 'https://demo.sivanland.com/pay';
  String urlBase = 'http://192.168.168.215:6005/pay';

  @override
  void initState() {
    super.initState();
    token = UserPreferences().getToken();
    panelOrderRequestModel.token = token;
    paymentInitRequestModel.token = token;
  }

  @override
  Widget build(BuildContext context) {
    Future<PanelOrderResponseData> getOrderData() =>
        apiServicePanel.getOrderData(panelOrderRequestModel);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "سفارش ها",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: getOrderData(),
              builder: (context, snapshot) {
                print("jsonEncode(snapshot)");
                print(snapshot.error);
                print(snapshot.stackTrace);
                print(jsonEncode(snapshot.data));
                if (snapshot.hasData) {
                  orderData = PanelOrderResponseData.fromJson(
                      jsonDecode(jsonEncode(snapshot.data)));
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: orderData.docs!.length,
                      itemBuilder: (context, index) {
                        paymentInitRequestModel.paymentId =
                            orderData.docs![index].list![0].payment_info![0].id;
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(index.toString()),
                              Text(orderData.docs![index].cart_id.toString()),
                              Text(orderData.docs![index].count.toString()),
                              ElevatedButton(
                                onPressed: () {
                                  apiServicePanel.getProforma();
                                },
                                child: Text("فاکتور"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  apiServicePanel
                                      .initPayment(paymentInitRequestModel)
                                      .then(
                                    (value) {
                                      // print(jsonEncode(value.data));
                                      print("jsonEncode(value.data!.form)");
                                      print(jsonEncode(value.data!.form));
                                    },
                                  );
                                },
                                child: Text("پرداخت"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // String urlFinal = "$urlBase?token=$token&pay_code=${orderData.docs![index].cart_id}";
                                  String urlFinal =
                                      "$urlBase/${orderData.docs![index].list![0].payment_info![0].id}/$token";
                                  print("urlFinal");
                                  print(urlFinal);
                                  _launchURL(urlFinal);
                                },
                                child: Text("مرورگر"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('بروز خطا هنگام دریافت سفارش ها'),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
