import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/screen/panel/entry/forgot_code_screen.dart';
import 'package:flutter_sl_001/screen/panel/profile_screen_content.dart';
import 'package:flutter_sl_001/screen/panel/entry/signup_screen.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  LoginRequestModel loginRequestModel =
      LoginRequestModel(phone: "", password: "");
  LoginData user = LoginData(token: '');
  bool _isApiCallProcess = false;
  APIServicePanel apiService = APIServicePanel();

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    Future<String?> getTokenString() => UserPreferences().getTokenAsync();
    return Scaffold(
      extendBodyBehindAppBar: false,
      key: scaffoldKey,
      body: FutureBuilder(
        future: getTokenString(),
        builder: (context, snapshot) {
          switch (snapshot.data) {
            case null:
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    Form(
                      key: globalFormKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? 'شماره تماس خود را وارد کنید'
                                  : null,
                              autofocus: false,
                              textDirection: TextDirection.ltr,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
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
                              onChanged: (input) {
                                loginRequestModel.phone = input;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              validator: (value) => value!.isEmpty
                                  ? 'رمز عبور را وارد کنید'
                                  : null,
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
                                loginRequestModel.password = input;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 2.4,
                          color: Theme.of(context).primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        if (globalFormKey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        child: Text(
                          "ورود",
                          style: TextStyle(
                            fontFamily: 'Vazir',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    Container(
                      height: 42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('قبلا عضو شده اید؟'),
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
                            child: const Text("ثبت نام"),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 10),
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
                                  builder: (context) =>
                                      const ForgotCodeScreen(),
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
              );
            default:
              return ProfileScreenContent();
          }
        },
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

  void login() {
    setState(
      () {
        _isApiCallProcess = true;
      },
    );
    apiService.login(loginRequestModel).then(
      (value) {
        print("Result in Login 1: ${value.success} and: ${value.message}");
        Provider.of<UserProvider>(context, listen: false).setUser(value.data!);
        Provider.of<UserProvider>(context, listen: false)
            .setToken(value.data!.token!);

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreenContent(),
          ),
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
}
