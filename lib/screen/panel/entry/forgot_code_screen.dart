import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_send_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_validate_model.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/entry/signup_screen.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotCodeScreen extends StatefulWidget {
  const ForgotCodeScreen({Key? key}) : super(key: key);

  @override
  _ForgotCodeScreenState createState() => _ForgotCodeScreenState();
}

class _ForgotCodeScreenState extends State<ForgotCodeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKeyForgetPass1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyForgetPass2 = GlobalKey<FormState>();

  APIServicePanel apiService = APIServicePanel();
  late ForgetCodeSendRequestModel forgetCodeSendRequestModel; //late
  late ForgetCodeValidateRequestModel forgetCodeValidateRequestModel; //late
  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    forgetCodeSendRequestModel = ForgetCodeSendRequestModel(
      phone: '',
    );
    forgetCodeValidateRequestModel = ForgetCodeValidateRequestModel(
      phone: '',
      newPass: '',
      recCode: '',
    );
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
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/panel/login_header_2.png',
                    width: MediaQuery.of(context).size.width,
                  ),                  Center(
                    child: SvgPicture.asset(
                      'assets/svg/logo_sl_2.svg',
                      // color: Theme.of(context).primaryColor,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  )
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  children: [
                    Form(
                      key: formKeyForgetPass1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Phone Number
                          TextFormField(
                            validator: (value) => value!.isEmpty
                                ? '?????????? ???????? ?????? ???? ???????? ????????'
                                : null,
                            // autofocus: true,
                            textDirection: TextDirection.ltr,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              label: Text('?????????? ????????'),
                              prefixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.all(18),
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
                            onChanged: (input) {
                              forgetCodeSendRequestModel.phone = input;
                              forgetCodeValidateRequestModel.phone = input;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Resend Forgotten Validation Code
                          OutlinedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 2.8,
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () async {
                              if (formKeyForgetPass1.currentState!.validate()) {
                                getNewValidationCode();
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Text(
                                "?????????????? ???? ??????????",
                                style: TextStyle(
                                    fontFamily: 'Vazir', fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: formKeyForgetPass2,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            validator: (value) => value!.isEmpty
                                ? '???? ?????????? ???????????? ?????? ???? ???????? ????????'
                                : null,
                            textDirection: TextDirection.ltr,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              label: Text("???? ??????????"),
                              contentPadding: EdgeInsets.all(18),
                              prefixIcon: Icon(Icons.code),
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
                            onChanged: (input) {
                              forgetCodeValidateRequestModel.recCode = input;
                            },
                          ),
                          const SizedBox(height: 16),
                          // Password
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) => value!.isEmpty
                                ? '?????? ???????? ???????? ???? ???????? ????????'
                                : null,
                            textDirection: TextDirection.ltr,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                              label: Text("?????? ????????"),
                              contentPadding: EdgeInsets.all(18),
                              prefixIcon: Icon(Icons.lock),
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
                            onChanged: (input) {
                              forgetCodeValidateRequestModel.newPass = input;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Signup and request code on phone
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 2.8,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        if (formKeyForgetPass2.currentState!.validate()) {
                          confirmNewPass();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Text(
                          "?????????? ?????? ???????? ????????",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('?????? ??????????????'),
                          TextButton(
                            // style: TextButton.styleFrom(fixedSize: Size.fromHeight(30)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text("?????? ??????"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('?????? ????????????'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text("???????? ????????"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getNewValidationCode() {
    setState(
      () {
        _isApiCallProcess = true;
      },
    );
    apiService.forgetCodeSend(forgetCodeSendRequestModel).then(
      (value) {
        if (value.status == 200) {
          _isApiCallProcess = false;
          Fluttertoast.showToast(
            msg: value.message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            // timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            // fontSize: 16.0,
          );
        } else {
          // throw Exception('Login Failed!');
          Fluttertoast.showToast(
            msg: value.message.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            // timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            // fontSize: 16.0,
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        setState(
          () {
            _isApiCallProcess = false;
          },
        );
      },
    );
  }

  void confirmNewPass() {
    setState(() {
      _isApiCallProcess = true;
    });
    apiService.forgetCodeValidate(forgetCodeValidateRequestModel).then(
      (value) {
        setState(
          () {
            if (value.status == 200) {
              _isApiCallProcess = false;
              toast(message: value.message.toString(), long: true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            } else {
              toast(message: value.message.toString(), long: false);
            }
          },
        );
      },
    ).onError(
      (error, stackTrace) {
        Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
      },
    ).whenComplete(
      () {
        setState(
          () {
            _isApiCallProcess = false;
          },
        );
      },
    );
  }

  void toast({required String message, bool? long}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: long == true ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // fontSize: 16.0,
    );
  }

  bool validateAndSave() {
    final form = formKeyForgetPass1.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
