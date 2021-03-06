import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';
import 'package:flutter_svg/svg.dart';

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
  GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();

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
              Form(
                key: formKeyValidate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /*TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "?????????? ????????",
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
                        hintText: "???? ?????????????? ???????? ??????????",
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
                          "?????????? ????",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
