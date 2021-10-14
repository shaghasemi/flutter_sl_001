import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';

class ValidateSignupScreen extends StatefulWidget {
  final String passedPhoneNumber;

  const ValidateSignupScreen({
    Key? key,
    required this.passedPhoneNumber,
  }) : super(key: key);

  @override
  State<ValidateSignupScreen> createState() => _ValidateSignupScreenState();
}

class _ValidateSignupScreenState extends State<ValidateSignupScreen> {
  late ValidateSignupRequestModel validateSignupRequestModel; //late
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    validateSignupRequestModel =
        ValidateSignupRequestModel(phone: "", code: "");
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    validateSignupRequestModel.phone = widget.passedPhoneNumber;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              // key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "شماره تلفن",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    onChanged: (input) {
                      validateSignupRequestModel.phone = input;
                    },
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),*/
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "کد دریافتی تلفن همراه",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    onChanged: (input) {
                      validateSignupRequestModel.code = input;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // var response = {};
                      setState(
                        () {
                          isApiCallProcess = true;
                        },
                      );
                      APIServicePanel apiService = APIServicePanel();
                      try {
                        apiService
                            .validateSignup(validateSignupRequestModel)
                            .then(
                          (value) {
                            /*MySharedPreferences.mySharedPreferences.setString(
                              "token",
                              value.data!.token.toString(),
                            );
                            MySharedPreferences.mySharedPreferences.setString(
                              "user_data",
                              jsonEncode(value),
                            );*/
                            print(jsonEncode(value));
                            setState(
                              () {
                                // isApiCallProcess = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                            );
                          },
                          onError: (err) {
                            // print("Error1" + err);
                          },
                        ).whenComplete(
                          () {
                            print("Complete");
                            setState(
                              () {
                                isApiCallProcess = false;
                              },
                            );
                          },
                        );
                      } catch (myError) {
                        // print("My Error");
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Text(
                        "بررسی کد",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
