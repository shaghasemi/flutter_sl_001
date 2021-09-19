import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/my_shared_pref.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';

class UserInfoScreenTemp extends StatefulWidget {
  const UserInfoScreenTemp({Key? key}) : super(key: key);

  @override
  State<UserInfoScreenTemp> createState() => _UserInfoScreenTempState();
}

class _UserInfoScreenTempState extends State<UserInfoScreenTemp> {
  // late UserInfoRequestModel userInfoRequestModel;
  // late UserInfoResponseModel userInfo;
  // late Map myMap;
  List<Map<String, dynamic>> infoList = [];
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    var infoMap = jsonDecode(
        MySharedPreferences.mySharedPreferences.getString("user_data")!);
    var myMap = Map<String, dynamic>.from(infoMap['data']['user_id']);
    myMap.forEach(
      (key, value) {
        infoList.add({
          'key': key,
          'value': value,
        });
      },
    );
    // userInfoRequestModel = UserInfoRequestModel(token: '');
    // isApiCallProcess = true;
    // APIService apiService = APIService();
    /*apiService.userInfo(userInfoRequestModel).then(
      (value) {
        setState(
          () {
            if (value.status == 200) {
              // isApiCallProcess = false;
              userInfo = value;
              // print("Well Done!");
              // print(jsonEncode(value.data));
              // print(jsonEncode(value.data!.userId));
              */ /*print(
                MySharedPreferences.mySharedPreferences.getString("user_data"),
              );*/ /*
              */ /*var items = MySharedPreferences.mySharedPreferences
                  .getString("user_data");*/ /*
              // items = value.data!.userId;
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
            isApiCallProcess = false;
          },
        );
      },
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
    return Container(
      // color: Colors.yellow,
      // constraints: BoxConstraints(minWidth: 150, minHeight: 250),
      // height: 300,
      // width: double.infinity,
      // width: 200,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: infoList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 100,
                      // height: 20,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: Text(infoList[i]['value'].toString()),
                    ),
                  ),
                  title: Text(infoList[i]['key']),
                  dense: false,
                  // leading: Text(infoList[i]['value'].toString()),
                  // title: Text("Hey"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
