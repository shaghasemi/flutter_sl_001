import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/model/panel/resend_code_model.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/panel/entry/forgot_code_screen.dart';
import 'package:flutter_sl_001/screen/panel/entry/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: globalFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'شماره تماس خود را وارد کنید' : null,
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
                    const SizedBox(
                      height: 30,
                    ),
                    // Password
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'رمز عبور را وارد کنید' : null,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        hintText: "رمز عبور",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      onChanged: (input) {
                        signupRequestModel.password = input;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Signup and request code on phone
                    ElevatedButton(
                      onPressed: () async {
                        signup();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Text(
                          "دریافت کد احراز",
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        resendCode();
                      },
                      child: const Text("ارسال مجدد کد"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Validation Code received via phone
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'رمز عبور را وارد کنید' : null,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "کد احراز هویت دریافت شده با تلفن همراه",
                        prefixIcon: Icon(Icons.code),
                      ),
                      autofocus: false,
                      onChanged: (input) {
                        validateSignupRequestModel.code = input;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Validate signup using received code
                    ElevatedButton(
                      onPressed: () async {
                        validateSignup();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Text(
                          "تایید",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Go to Login Page
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text("عضو هستید؟ وارد شوید"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Go to Login Page
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotCodeScreen()),
                        );
                      },
                      child: const Text("فراموشی رمز عبور"),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    apiService.signup(signupRequestModel).then(
      (value) {
        setState(
          () {
            if (value.status == 200) {
              isApiCallProcess = false;
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
      },
      onError: (err) {},
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
    validateApiService.validateSignup(validateSignupRequestModel).then(
      (value) {
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
      },
      onError: (err) {
        print("On Error:" + err);
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
    apiService.resendCode(resendCodeRequestModel).then(
      (value) {
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
      },
      onError: (err) {},
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
