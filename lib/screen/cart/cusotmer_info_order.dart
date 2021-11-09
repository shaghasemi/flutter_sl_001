import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/order/register_list_model.dart';
import 'package:flutter_sl_001/screen/cart/confirm_order_screen.dart';

class CustomerInfoOrderScreen extends StatefulWidget {
  const CustomerInfoOrderScreen({Key? key}) : super(key: key);

  @override
  State<CustomerInfoOrderScreen> createState() =>
      _CustomerInfoOrderScreenState();
}

class _CustomerInfoOrderScreenState extends State<CustomerInfoOrderScreen> {
  String token = '';
  GlobalKey<FormState> _formKeyReal = GlobalKey<FormState>();

  Future<String> getToken() async => UserPreferences().getToken();
  late RegisterListRequestModel registerListRequestModel;

  /*RegisterListRequestModel registerListRequestModel = RegisterListRequestModel(
      customerInfo: Customer_info(), orderList: [Order_list()]);*/

  @override
  void initState() {
    super.initState();
    registerListRequestModel = RegisterListRequestModel(
      // token: '',
      customerInfo: Customer_info(
          companyEconomicCode: '',
          companyName: '',
          companyNationalId: '',
          companyPostalCode: '',
          companyRebuildCode: '',
          companyRegistrationCode: '',
          companyTelephone: '',
          family: '',
          mobile: '',
          name: '',
          nationalCode: '',
          personal: true,
          postalCode: '7135641258',
          sosPhone: ''),
    );
    getToken().then((value) async {
      return registerListRequestModel.token = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: Text(
              "تکمیل اطلاعات",
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  // fontFamily: 'Vazir',
                  ),
            ),
            // backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKeyReal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "الزامی";
                          }
                          if (val.length < 2) {
                            return "نام حداقل دو حرف می باشد.";
                          }
                        },
                        onChanged: (input) {
                          registerListRequestModel.customerInfo!.name =
                              input.toString();
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'نام',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          // errorText: " نام استان حداقل دو حرف می باشد.",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: TextFormField(
                        onChanged: (input) {
                          registerListRequestModel.customerInfo!.family =
                              input.toString();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "الزامی";
                          }
                          if (val.length < 2) {
                            return "نام خانوادگی حداقل دو حرف می باشد.";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'نام خانوادگی',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          // errorText: " نام استان حداقل دو حرف می باشد.",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: TextFormField(
                        onChanged: (input) {
                          registerListRequestModel.customerInfo!.nationalCode =
                              input.toString();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "کد ملی الزامی است";
                          } else if (val.length != 10) {
                            return "کد ملی 10 رقم است";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'کد ملی',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          // errorText: " نام استان حداقل دو حرف می باشد.",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      onChanged: (input) {
                        registerListRequestModel.customerInfo!.mobile =
                            input.toString();
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "شماره موبایل الزامی است";
                        }
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'شماره موبایل',
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        // errorText: " نام استان حداقل دو حرف می باشد.",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: TextFormField(
                        onChanged: (input) {
                          registerListRequestModel.customerInfo!.sosPhone =
                              input.toString();
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "تلفن اضطراری الزامی است";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: 'تلفن اضطراری',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          // errorText: " نام استان حداقل دو حرف می باشد.",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(8),
            padding: MaterialStateProperty.all(
              EdgeInsets.fromLTRB(12, 10, 18, 10),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'مرحله بعدی',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward),
          ],
        ),
        onPressed: () {
          if (_formKeyReal.currentState!.validate()) {
            //TODO: Confirm Order
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrderScreen(
                  customerInfo: registerListRequestModel.customerInfo!,
                  token: token,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
