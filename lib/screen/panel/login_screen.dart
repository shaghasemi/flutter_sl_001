import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
import 'package:flutter_sl_001/provider_test/user_provider.dart';
import 'package:flutter_sl_001/screen/panel/forgot_code_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';
import 'package:flutter_sl_001/screen/panel/signup_screen.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  late LoginData user;
  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel(phone: "", password: "");
    user = LoginData(token: '');
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
    Future<String?> getTokenString() => UserPreferences().getToken();
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
        body: FutureBuilder(
          future: getTokenString(),
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case null:
                return Center(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Form(
                                key: globalFormKey,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.phone,
                                        decoration: const InputDecoration(
                                          hintText: "شماره تلفن",
                                          prefixIcon: Icon(Icons.phone),
                                        ),
                                        onChanged: (input) {
                                          loginRequestModel.phone = input;
                                        },
                                        autofocus: true,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "رمز عبور",
                                          prefixIcon: Icon(Icons.lock),
                                        ),
                                        onChanged: (input) {
                                          loginRequestModel.password = input;
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton(
                                          onPressed: () async {
                                            setState(() {
                                              _isApiCallProcess = true;
                                            });
                                            APIServicePanel apiService =
                                                APIServicePanel();
                                            try {
                                              apiService
                                                  .login(loginRequestModel)
                                                  .then(
                                                (value) {
                                                  if (value.status == 200) {
                                                    print(value.message);
                                                    user = value.data!;
                                                    UserPreferences.newPrefs
                                                        .setString(
                                                      "token",
                                                      value.data!.token
                                                          .toString(),
                                                    );
                                                    Provider.of<UserProvider>(context, listen:false).setUser(user);
                                                    /*UserPreferences.prefs.setString(
                                                "user_data",
                                                jsonEncode(value),
                                              );*/
                                                    // Create shared preferences and save user info
                                                    UserPreferences()
                                                        .saveUser(user);
                                                    Provider.of<UserProvider>(
                                                            context,
                                                            listen: false)
                                                        .setUser(user);

                                                    setState(() {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const ProfileScreenContent()));
                                                    });
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg: value.message
                                                            .toString(),
                                                        toastLength:
                                                            Toast.LENGTH_LONG,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        fontSize: 16.0);
                                                  }
                                                },
                                                onError: (err) {
                                                  print("On Error");
                                                  print(err);
                                                },
                                              ).whenComplete(() {
                                                print("Complete");
                                                setState(() {
                                                  _isApiCallProcess = false;
                                                });
                                              });
                                            } catch (myError) {
                                              print("Catche Error");
                                            }
                                          },
                                          child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 32,
                                                vertical: 16,
                                              ),
                                              child: Text("ورود",
                                                  style: TextStyle(
                                                      fontFamily: 'Vazir',
                                                      fontSize: 20)))),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignupScreen()));
                                        },
                                        child: const Text("ثبت نام"),
                                      ),
                                      const SizedBox(height: 30),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgotCodeScreen()));
                                        },
                                        child: const Text("فراموشی رمز عبور"),
                                      )
                                    ])))));
              default:
                return ProfileScreenContent();
            }
          },
        ));
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
