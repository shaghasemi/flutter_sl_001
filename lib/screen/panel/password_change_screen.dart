import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/data/local/user_pref.dart';
import 'package:flutter_sl_001/model/panel/change_password_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String phoneNumberInput;
  final String tokenInput;

  const ChangePasswordScreen({
    Key? key,
    required this.phoneNumberInput,
    required this.tokenInput,
  }) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKeyChangePassword = GlobalKey<FormState>();
  APIServicePanel apiService = APIServicePanel();
  ChangePasswordRequestModel changePasswordRequestModel =
      ChangePasswordRequestModel(
          phone: '', oldPass: '', token: '', newPass: '');
  bool _isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      isAsyncCall: _isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    changePasswordRequestModel.token = widget.tokenInput;
    changePasswordRequestModel.phone = widget.phoneNumberInput;
    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          SliverAppBar(
            title: const Text(
              "تغییر رمز عبور",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: formKeyChangePassword,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'رمز عبور پیشین را وارد کنید' : null,
                      textDirection: TextDirection.ltr,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: Text("رمز عبور پیشین"),
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
                        changePasswordRequestModel.oldPass = input;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'رمز عبور جدید را وارد کنید' : null,
                      textDirection: TextDirection.ltr,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: Text("رمز عبور جدید"),
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
                        changePasswordRequestModel.newPass = input;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                        if (formKeyChangePassword.currentState!.validate()) {
                          changePassword();
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
      ),
    );
  }

  void changePassword() {
    // var response = {};
    setState(
      () {
        _isApiCallProcess = true;
      },
    );
    apiService.changePassword(changePasswordRequestModel).then(
      (value) {
        _isApiCallProcess = false;
        Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          // timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0,
        );
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

  bool validateAndSave() {
    final form = formKeyChangePassword.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
