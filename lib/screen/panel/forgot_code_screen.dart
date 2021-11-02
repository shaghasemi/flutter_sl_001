import 'package:flutter/material.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_send_model.dart';
import 'package:flutter_sl_001/model/panel/forgot_code_validate_model.dart';
import 'package:flutter_sl_001/screen/panel/login_screen.dart';
import 'package:flutter_sl_001/screen/panel/signup_screen.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotCodeScreen extends StatefulWidget {
  const ForgotCodeScreen({Key? key}) : super(key: key);

  @override
  _ForgotCodeScreenState createState() => _ForgotCodeScreenState();
}

class _ForgotCodeScreenState extends State<ForgotCodeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Check if form is valid
  //TODO
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late ForgetCodeSendRequestModel forgetCodeSendRequestModel; //late
  late ForgetCodeValidateRequestModel forgetCodeValidateRequestModel; //late
  bool isApiCallProcess = false;

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
      isAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      /*body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.alarm),
                Icon(Icons.settings),
              ],
            ),
            snap: true,
            floating: true,
          ),
        ],*/
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phone Number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "شماره تلفن",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    onChanged: (input) {
                      forgetCodeSendRequestModel.phone = input;
                      forgetCodeValidateRequestModel.phone = input;
                    },
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Resend Forgotten Validation Code
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
                            .forgetCodeSend(forgetCodeSendRequestModel)
                            .then(
                          (value) {
                            if (value.status == 200) {
                              isApiCallProcess = false;
                              Fluttertoast.showToast(
                                msg: value.message.toString(),
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                // timeInSecForIosWeb: 1,
                                // backgroundColor: Colors.red,
                                // textColor: Colors.white,
                                fontSize: 16.0,
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
                                fontSize: 16.0,
                              );
                            }
                          },
                          onError: (err) {
                            print("Error1" + err);
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
                        print("Catch Error");
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Text(
                        "درخواست مجدد کد احراز",
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  /*TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()),
                      );
                    },
                    child: const Text("عضو نیستید؟ ثبت نام کنید"),
                  ),*/
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "کد احراز دریافت شده",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    autofocus: true,
                    onChanged: (input) {
                      forgetCodeValidateRequestModel.recCode = input;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Password
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "رمز عبور جدید",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    onChanged: (input) {
                      forgetCodeValidateRequestModel.newPass = input;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Signup and request code on phone
                  ElevatedButton(
                    onPressed: () async {
                      setState(
                        () {
                          isApiCallProcess = true;
                        },
                      );
                      APIServicePanel apiService = APIServicePanel();
                      try {
                        apiService
                            .forgetCodeValidate(forgetCodeValidateRequestModel)
                            .then(
                          (value) {
                            setState(
                              () {
                                if (value.status == 200) {
                                  isApiCallProcess = false;
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
                                            child: const Text("بستن"),
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
                        "تایید رمز عبور جدید",
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
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text("وارد شدن"),
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
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text("ثبت نام"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
