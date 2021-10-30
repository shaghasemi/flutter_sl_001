import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/order/register_list_model.dart';
import 'package:flutter_sl_001/screen/cart/confirm_order_screen.dart';

class CustomerInfoOrderScreen extends StatefulWidget {
  const CustomerInfoOrderScreen({Key? key}) : super(key: key);

  @override
  State<CustomerInfoOrderScreen> createState() =>
      _CustomerInfoOrderScreenState();
}

class _CustomerInfoOrderScreenState extends State<CustomerInfoOrderScreen> {
  late String? token;
  GlobalKey<FormState> _formKeyReal = GlobalKey<FormState>();

  Future<String> getToken() => UserPreferences().getToken();
  late RegisterListRequestModel registerListRequestModel;

  /*RegisterListRequestModel registerListRequestModel = RegisterListRequestModel(
      customerInfo: Customer_info(), orderList: [Order_list()]);*/

  @override
  void initState() {
    super.initState();
    getToken().then((value) => token = value);
    registerListRequestModel =
        RegisterListRequestModel(customerInfo: Customer_info());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "تکمیل اطلاعات خرید",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
            actions: [
              TextButton(
                onPressed: () {
                  if (_formKeyReal.currentState!.validate()) {
                    //TODO: Confirm Order
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmOrderScreen(
                          customerInfo: registerListRequestModel.customerInfo!,
                          token: token!,
                        ),
                      ),
                    );
                  }
                },
                child: Text("مرحله بعدی"),
              ),
            ],
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyReal,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (input) {
                      registerListRequestModel.customerInfo!.name =
                          input.toString();
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // hintText: 'نام',
                      labelText: 'نام',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الزامی";
                      }
                      if (val.length < 2) {
                        return "نام حداقل دو حرف می باشد.";
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (input) {
                      registerListRequestModel.customerInfo!.family =
                          input.toString();
                    },
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      // hintText: 'نام خانوادگی',
                      labelText: 'نام خانوادگی',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الزامی";
                      }
                      if (val.length < 2) {
                        return "نام خانوادگی حداقل دو حرف می باشد.";
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (input) {
                      registerListRequestModel.customerInfo!.nationalCode =
                          input.toString();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: 'کد ملی',
                      labelText: 'کد ملی',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الزامی";
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (input) {
                      registerListRequestModel.customerInfo!.mobile =
                          input.toString();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: 'تلفن همراه',
                      labelText: 'تلفن همراه',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الزامی";
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (input) {
                      registerListRequestModel.customerInfo!.sosPhone =
                          input.toString();
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // hintText: 'تلفن همراه ضروری',
                      labelText: 'تلفن همراه ضروری',
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "الزامی";
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
