import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/panel/user_info_edit.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';

class UserInfoEditScreenUpdated extends StatefulWidget {
  const UserInfoEditScreenUpdated({Key? key}) : super(key: key);

  @override
  State<UserInfoEditScreenUpdated> createState() =>
      _UserInfoEditScreenUpdatedState();
}

class _UserInfoEditScreenUpdatedState extends State<UserInfoEditScreenUpdated> {
  late UserInfoRequestModel userInfoRequestModel; //late
  late UserInfoEditRequestModel userInfoEditRequestModel; //late
  late Data userInfo; //late
  APIService apiService = APIService();
  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    userInfo = Data();
    String token =
        MySharedPreferences.mySharedPreferences.getString("token") ?? "aaa";
    userInfoRequestModel = UserInfoRequestModel(token: token);
    // userInfoEditRequestModel = UserInfoEditRequestModel(token: token);
    fetchUserInfo();
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
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("نام"),
                TextFormField(
                  initialValue: userInfo.user_id!.name ?? "Name Placeholder",
                  onChanged: (input) {
                    userInfoEditRequestModel.name = input;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void fetchUserInfo() {
    apiService.getUserInfo(userInfoRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        userInfo = value.data!;
      }
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }

  void editUserInfo() {
    apiService.editUserInfo(userInfoEditRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        // userInfo = value.data!;
      }
    }).whenComplete(
          () => _isApiCallProcess = false,
    );
  }
}
