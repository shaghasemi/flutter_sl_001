import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/model/panel/resend_code_model.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/panel/entry/forgot_code_screen.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyValidationSignup = GlobalKey<FormState>();
  FocusNode focusNodeValidation = FocusNode();

  SignupRequestModel signupRequestModel =
      SignupRequestModel(phone: '', password: '');
  ValidateSignupRequestModel validateSignupRequestModel =
      ValidateSignupRequestModel(phone: '', code: ''); //late
  ResendCodeRequestModel resendCodeRequestModel =
      ResendCodeRequestModel(phone: ''); //late
  APIServicePanel apiService = APIServicePanel();
  APIServicePanel validateApiService = APIServicePanel();
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/panel/login_header_2.png'),
                Center(
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
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  Form(
                    key: globalFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) => value!.isEmpty
                              ? 'شماره تماس خود را وارد کنید'
                              : null,
                          keyboardType: TextInputType.phone,
                          textDirection: TextDirection.ltr,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            label: Text('شماره تلفن'),
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
                          autofocus: false,
                          onChanged: (input) {
                            signupRequestModel.phone = input;
                            validateSignupRequestModel.phone = input;
                            resendCodeRequestModel.phone = input;
                          },
                        ),
                        const SizedBox(height: 16),
                        // Password
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          validator: (value) =>
                              value!.isEmpty ? 'رمز عبور را وارد کنید' : null,
                          textDirection: TextDirection.ltr,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            label: Text("رمز عبور"),
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
                            signupRequestModel.password = input;
                          },
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
                            if (globalFormKey.currentState!.validate()) {
                              signup();
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 12,
                            ),
                            child: Text(
                              "دریافت کد احراز",
                              style: TextStyle(
                                fontFamily: 'Vazir',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            resendCode();
                          },
                          child: const Text("ارسال مجدد کد"),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKeyValidationSignup,
                    child: Column(children: [
                      const SizedBox(height: 30),
                      // Validation Code received via phone
                      TextFormField(
                        focusNode: focusNodeValidation,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'کد احراز را وارد کنید';
                          } else if (value.length < 4) {
                            return 'کد احراز را به صروت کامل وارد کنید';
                          } else {
                            return null;
                          }
                        },
                        autofocus: false,
                        textDirection: TextDirection.ltr,
                        textInputAction: TextInputAction.go,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            // fontSize: 24,
                            ),
                        decoration: InputDecoration(
                          label: Text('کد احراز'),
                          prefixIcon: Icon(Icons.code),
                          contentPadding: EdgeInsets.all(18),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 2.8,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                        maxLength: 4,
                        onChanged: (input) {
                          validateSignupRequestModel.code = input;
                        },
                      ),
                      const SizedBox(height: 16),
                      // Validate signup using received code
                      OutlinedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 3.2,
                            color: Theme.of(context).primaryColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () async {
                          if (formKeyValidationSignup.currentState!
                              .validate()) {
                            validateSignup();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          child: Text(
                            "تایید",
                            style: TextStyle(
                              fontFamily: 'Vazir',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ]),
                  ),
                  // Go to Login Page
                  Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('عضو هستید؟'),
                        TextButton(
                          // style: TextButton.styleFrom(fixedSize: Size.fromHeight(30)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text("وارد شوید"),
                        ),
                      ],
                    ),
                  ),
                  // Go to Login Page
                  Container(
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'رمز عبور را فراموش کرده اید؟', /*style: TextStyle(fontSize: ),*/
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgotCodeScreen(),
                              ),
                            );
                          },
                          child: const Text("بازیابی رمز"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void signup() {
    setState(
      () {
        isApiCallProcess = true;
      },
    );
    apiService.signup(signupRequestModel).then((value) {
      setState(
        () {
          if (value.status == 200) {
            isApiCallProcess = false;
            FocusScope.of(context).requestFocus(focusNodeValidation);
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: Text(value.error.toString()),
                  content: Text(value.message.toString()),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    ElevatedButton(
                      child: const Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    }).onError(
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
            isApiCallProcess = false;
          },
        );
      },
    );
  }

  void validateSignup() {
    setState(
      () {
        isApiCallProcess = true;
      },
    );
    validateApiService.validateSignup(validateSignupRequestModel).then((value) {
      setState(
        () {
          if (value.status == 200) {
            // isApiCallProcess = false;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: Text(value.error.toString()),
                  content: Text(value.message.toString()),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    ElevatedButton(
                      child: const Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    }).onError(
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
            isApiCallProcess = false;
          },
        );
      },
    );
  }

  void resendCode() {
    setState(
      () {
        isApiCallProcess = true;
      },
    );
    APIServicePanel apiService = APIServicePanel();
    apiService.resendCode(resendCodeRequestModel).then((value) {
      setState(
        () {
          if (value.status == 200) {
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: Text(value.error.toString()),
                  content: Text(value.message.toString()),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    ElevatedButton(
                      child: const Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    }).onError(
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
            isApiCallProcess = false;
          },
        );
      },
    );
  }
}
