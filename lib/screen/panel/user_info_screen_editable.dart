import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service.dart';
import 'package:flutter_sl_001/data/local/shared_pref.dart';
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
  late Data userInfo;
  APIService apiService = APIService();
  bool _isApiCallProcess = true;

  @override
  void initState() {
    super.initState();
    userInfo = Data();
    String token =
        UserPreferences.prefs.getString("token") ?? "aaa";
    userInfoRequestModel = UserInfoRequestModel(token: token);
    userInfoEditRequestModel = UserInfoEditRequestModel(token: token);
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
    userInfoEditRequestModel.name = userInfo.user_id!.name!;
    userInfoEditRequestModel.family = userInfo.user_id!.family!;
    userInfoEditRequestModel.gender = userInfo.user_id!.gender!.toString();
    /*switch (userInfo.user_id!.gender!) {
      case 0:
        {
          userInfoEditRequestModel.gender = 0;
        }
        break;
      case 1:
        {
          userInfoEditRequestModel.gender = 1;
        }
        break;
    }*/
    userInfoEditRequestModel.email = userInfo.user_id!.email!;
    userInfoEditRequestModel.mainAddress = userInfo.user_id!.main_address!;
    userInfoEditRequestModel.nationalCode = userInfo.user_id!.national_code!;
    userInfoEditRequestModel.birthday = userInfo.user_id!.birthday!;
    userInfoEditRequestModel.foreignNational =
        userInfo.user_id!.foreign_national!;
    userInfoEditRequestModel.postalCode = userInfo.user_id!.postal_code!;
    userInfoEditRequestModel.telephone = userInfo.user_id!.telephone!;
    userInfoEditRequestModel.sosPhone = userInfo.user_id!.sosPhone!;
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        const SliverAppBar(
          title: Text(
            "مشخصات کاربر",
            style: TextStyle(
                // color: Color(0xff28a745),
                fontWeight: FontWeight.bold,
                fontFamily: 'Vazir'),
          ),
          backgroundColor: Color(0xff28a745),
          snap: true,
          centerTitle: true,
          floating: true,
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("نام"),
                  TextFormField(
                    initialValue: userInfo.user_id!.name!,
                    onChanged: (input) {
                      userInfoEditRequestModel.name = input;
                    },
                  ),
                ],
              ),
            ),
            //Surname
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("نام خانوادگی"),
                  TextFormField(
                    initialValue: userInfo.user_id!.family!,
                    onChanged: (input) {
                      userInfoEditRequestModel.family = input;
                    },
                  ),
                ],
              ),
            ),
            // Gender
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("جنسیت"),
                  TextFormField(
                    initialValue: userInfo.user_id!.gender!.toString(),
                    onChanged: (input) {
                      int? genderInput;
                      // userInfoEditRequestModel.gender = 1;
                      // userInfoEditRequestModel.gender = int.parse(input);
                      userInfoEditRequestModel.gender = input;
                      // userInfoEditRequestModel.gender = switch(input) {};
                      /*switch (input) {
                        case "male":
                          {
                            genderInput = 0;
                          }
                          break;
                        case "female":
                          {
                            genderInput = 1;
                          }
                          break;
                      }
                      userInfoEditRequestModel.gender = genderInput;*/
                    },
                  ),
                ],
              ),
            ),
            // Email Address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("پست الکترونیک"),
                  TextFormField(
                    initialValue: userInfo.user_id!.email!,
                    onChanged: (input) {
                      userInfoEditRequestModel.email = input;
                    },
                  ),
                ],
              ),
            ),
            // Main Address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("نشانی اصلی"),
                  TextFormField(
                    initialValue: userInfo.user_id!.main_address!,
                    onChanged: (input) {
                      userInfoEditRequestModel.mainAddress = input;
                    },
                  ),
                ],
              ),
            ),
            // National Code
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("کد ملی"),
                  TextFormField(
                    initialValue: userInfo.user_id!.national_code!,
                    onChanged: (input) {
                      userInfoEditRequestModel.nationalCode = input;
                    },
                  ),
                ],
              ),
            ),
            // Birthday
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("تاریخ تولد"),
                  TextFormField(
                    initialValue: userInfo.user_id!.birthday!,
                    onChanged: (input) {
                      userInfoEditRequestModel.birthday = input;
                    },
                  ),
                ],
              ),
            ),
            // Foreign National
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("تابعیت خارجی"),
                  TextFormField(
                    initialValue: userInfo.user_id!.foreign_national!,
                    onChanged: (input) {
                      userInfoEditRequestModel.foreignNational = input;
                    },
                  ),
                ],
              ),
            ),
            // Postal Code
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("کد پستی"),
                  TextFormField(
                    initialValue: userInfo.user_id!.postal_code!,
                    onChanged: (input) {
                      userInfoEditRequestModel.postalCode = input;
                    },
                  ),
                ],
              ),
            ),
            // Telephone
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("شماره تلفن ثابت"),
                  TextFormField(
                    initialValue: userInfo.user_id!.telephone!,
                    onChanged: (input) {
                      userInfoEditRequestModel.telephone = input;
                    },
                  ),
                ],
              ),
            ),
            // SoS Phone
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("شماره تماس اضطراری"),
                  TextFormField(
                    initialValue: userInfo.user_id!.sosPhone!,
                    onChanged: (input) {
                      userInfoEditRequestModel.sosPhone = input;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isApiCallProcess = true;
                });
                updateUserInfo();
              },
              child: Text("بروزرسانی اطلاعات"),
            )
          ],
        ),
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

  void updateUserInfo() {
    apiService.editUserInfo(userInfoEditRequestModel).then((value) {
      setState(() {
        _isApiCallProcess = false;
      });
      if (value.status == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Successful Info Update"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Understood"),
              ),
            ],
          ),
        );
        // userInfo = value.data!;
      }
    }).whenComplete(
      () => _isApiCallProcess = false,
    );
  }
}
