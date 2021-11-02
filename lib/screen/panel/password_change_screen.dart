import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/panel/change_password_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Check if form is valid
  //TODO
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late ChangePasswordRequestModel changePasswordRequestModel; //late
  // late LoginResponseModel userDataRaw;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    changePasswordRequestModel = ChangePasswordRequestModel(
      phone: '',
      oldPass: '',
      token: '',
      newPass: '',
    );
    // userDataRaw = LoginResponseModel();
    /*var userDataRaw = json.decode(
      MySharedPreferences.mySharedPreferences.getString("user_data")!,
    );*/
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
    var userDataRaw = json.decode(
      UserPreferences.userPrefs.getString("user_data")!,
    );
    // changePasswordRequestModel.token = userDataRaw.data!.token!;
    changePasswordRequestModel.token = userDataRaw['data']['token'];
    changePasswordRequestModel.phone = userDataRaw['data']['mobile'];
    print(changePasswordRequestModel.token);
    print(changePasswordRequestModel.phone);
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
                  /*TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "شماره تلفن",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    onChanged: (input) {
                      changePasswordRequestModel.phone = input;
                    },
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),*/
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "رمز عبور پیشین",
                      prefixIcon: Icon(Icons.password),
                    ),
                    onChanged: (input) {
                      changePasswordRequestModel.oldPass = input;
                    },
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "رمز عبور جدید",
                      prefixIcon: Icon(Icons.password_outlined),
                    ),
                    onChanged: (input) {
                      changePasswordRequestModel.newPass = input;
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
                            .changePassword(changePasswordRequestModel)
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
                              Navigator.pop(context);
                              /*MySharedPreferences.mySharedPreferences.clear();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );*/
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
                        "تغییر رمز عبور",
                        style: TextStyle(fontFamily: 'Vazir', fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
