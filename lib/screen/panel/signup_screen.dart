import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/model/panel/signup_model.dart';
import 'package:flutter_sl_001/model/panel/signup_validation_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late SignupRequestModel signupRequestModel; //late
  late ValidateSignupRequestModel validateSignupRequestModel; //late
  bool isApiCallProcess = false;

  // Check if form is valid
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    signupRequestModel = SignupRequestModel(phone: '', password: '');
    validateSignupRequestModel =
        ValidateSignupRequestModel(phone: '', code: '');
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
    return Scaffold(
      key: scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "شماره تلفن",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    autofocus: true,
                    onChanged: (input) {
                      signupRequestModel.phone = input;
                      validateSignupRequestModel.phone = input;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
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
                  ElevatedButton(
                    onPressed: () async {
                      setState(
                        () {
                          isApiCallProcess = true;
                        },
                      );
                      APIService apiService = APIService();
                      try {
                        apiService.signup(signupRequestModel).then(
                          (value) {
                            setState(
                              () {
                                if (value.status == 200) {
                                  // isApiCallProcess = false;
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ValidateSignupScreen(
                                        passedPhoneNumber:
                                            signupRequestModel.phone,
                                      ),
                                    ),
                                  );*/
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
                      } catch (myError) {
                        throw (myError);
                      }
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "کد احراز هویت دریافت شده با تلفن همراه",
                      prefixIcon: Icon(Icons.code),
                    ),
                    autofocus: true,
                    onChanged: (input) {
                      validateSignupRequestModel.code = input;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(
                        () {
                          isApiCallProcess = true;
                        },
                      );
                      APIService validateApiService = APIService();
                      print(validateSignupRequestModel.phone);
                      print(validateSignupRequestModel.code);
                      try {
                        validateApiService
                            .validateSignup(validateSignupRequestModel)
                            .then(
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
                      } catch (myError) {
                        print("Try/Catch Error");
                        print(myError);
                        print(myError.toString());
                      }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
