import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/panel/panel_order_model.dart';
import 'package:flutter_sl_001/model/panel/payment_init_model.dart';
import 'package:flutter_sl_001/screen/helper/under_construction.dart';
import 'package:persian_number_utility/src/extensions.dart';
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
  int totalAmount = 0;
  int totalTransportPrice = 0;
  int totalProductPrice = 0;
  int tempProductPrice = 0;
  String bankUrl = '';

  String urlBase = 'https://sivanland.com/pay';

  // String urlBase = 'http://192.168.168.215:6005/pay';

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
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Vazir',
            ),
            title: const Text(
              "سفارش ها",
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
              builder:
                  (context, AsyncSnapshot<PanelOrderResponseData> snapshot) {
                if (snapshot.hasData) {
                  orderData = PanelOrderResponseData.fromJson(
                      jsonDecode(jsonEncode(snapshot.data)));
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount: orderData.docs!.length,
                      itemCount: snapshot.data!.docs!.length,
                      itemBuilder: (context, index) {
                        totalTransportPrice = 0;
                        tempProductPrice = 0;
                        totalProductPrice = 0;
                        var count = orderData.docs![index].count;
                        for (var i = 0;
                            i < orderData.docs![index].list!.length;
                            i++) {
                          totalTransportPrice += int.parse(
                              orderData.docs![index].list![i].transport_price!);
                          for (var j = 0;
                              j <
                                  orderData.docs![index].list![i].payment_info!
                                      .length;
                              j++) {
                            tempProductPrice += orderData
                                .docs![index].list![i].payment_info![j].amount!;
                          }
                          // totalProductPrice = count!*tempProductPrice;
                          totalProductPrice = tempProductPrice;
                          /*int totalPrice =
                              totalProductPrice + totalTransportPrice;*/
                          int totalPrice = orderData.docs![index].list![i]
                                  .payment_info![0].amount! +
                              totalTransportPrice;
                        }
                        /*orderData.docs![index].list![0].payment_info!
                            .map((e) => totalAmount + e.amount!*e.);*/
                        /*paymentInitRequestModel.paymentId =
                            orderData.docs![index].list![0].payment_info![0].id;*/
                        paymentInitRequestModel.paymentId = snapshot
                            .data!.docs![index].list![0].payment_info![0].id;
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'کد سبد خرید',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          orderData.docs![index].cart_id!
                                              .toString()
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'تاریخ ایجاد سبد',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          orderData.docs![index].createdAt!
                                              .toPersianDate(),
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'تعداد آیتم',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          orderData.docs![index].count!
                                              .toString()
                                              .toPersianDigit(),
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // TODO: COnvert payment code to text, to get from farshid
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'وضعیت عملیات پرداخت',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                            getPaymentStatus(orderData
                                                .docs![index].list![0].status!)
                                         ,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'قیمت نهایی',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          orderData.docs![index].list![0]
                                              .payment_info![0].amount
                                              .toString()
                                              .toPersianDigit()
                                              .seRagham(),
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          // apiServicePanel.getProforma();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const UnderConstructionScreen(),
                                            ),
                                          );
                                        },
                                        child: Text("مشاهده"),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // String urlFinal = "$urlBase?token=$token&pay_code=${orderData.docs![index].cart_id}";
                                          /*String urlFinal =
                                              "$urlBase/${orderData.docs![index].list![0].payment_info![0].id}/$token";*/
                                          String urlFinal =
                                              "$urlBase/${orderData.docs![index].list![0].payment_info![0].tracking_code}/$token";
                                          print("urlFinal");
                                          print(urlFinal);
                                          _launchURL(urlFinal);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                          child: Text(
                                            "پرداخت",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.system_update_alt,
                                          size: 32,
                                          // color: Colors.green,
                                        ),
                                        onPressed: () {
                                          _launchURL(
                                              'http://newapi.sivanland.com/api/guest/order/invoice/informal?code=${orderData.docs![index].cart_id!}');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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

  String getPaymentStatus(int payStatus) {
    String payStatusText = '';
    switch (payStatus) {
      case -8:
        payStatusText = 'لغو شده';
        break;
      case -6:
        payStatusText = 'لغو شده';
        break;
      case -4:
        payStatusText = 'لغو شده';
        break;
      case -2:
        payStatusText = 'لغو شده';
        break;
      case -0:
        payStatusText = 'در حال بررسی';
        break;
      case 2:
        payStatusText = 'موافقت مشتری';
        break;
      case 4:
        payStatusText = 'مخالفت مشتری';
        break;
      case 6:
        payStatusText = 'منتظر پرداخت';
        break;
      case 8:
        payStatusText = 'در دست اقدام';
        break;
      case 10:
        payStatusText = 'ارسال شده';
        break;
      case 12:
        payStatusText = 'تکمیل شده';
        break;
      case 14:
        payStatusText = 'مرجوع شده';
        break;
      case 16:
        payStatusText = 'بررسی صدور فاکتور';
        break;
      case 18:
        payStatusText = 'لغو فاکتور';
        break;
      case 20:
        payStatusText = 'فاکتور صادر شد';
        break;
      default:
        payStatusText = 'وضعیت مشخص نیست';
        break;
    }
    return payStatusText;
  }
}
