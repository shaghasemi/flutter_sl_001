import 'package:flutter/material.dart';
import 'package:flutter_sl_001/api/api_service_panel.dart';
import 'package:flutter_sl_001/data/provider/user_provider.dart';
import 'package:flutter_sl_001/model/panel/login_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_edit_request_model.dart';
import 'package:flutter_sl_001/model/panel/user_info_model.dart';
import 'package:flutter_sl_001/progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class UserInfoEditScreenUpdated extends StatefulWidget {
  final LoginData userInfoInput;

  const UserInfoEditScreenUpdated({Key? key, required this.userInfoInput})
      : super(key: key);

  @override
  State<UserInfoEditScreenUpdated> createState() =>
      _UserInfoEditScreenUpdatedState();
}

class _UserInfoEditScreenUpdatedState extends State<UserInfoEditScreenUpdated> {
  APIServicePanel apiService = APIServicePanel();
  UserInfoRequestModel userInfoRequestModel = UserInfoRequestModel(token: '');
  UserInfoEditRequestModel userInfoEditRequestModel =
      UserInfoEditRequestModel(token: '');
  UserInfoData userInfo = UserInfoData();
  bool _isApiCallProcess = false;
  LoginData input = LoginData();
  int _genderRdaio = 0;

  @override
  void initState() {
    super.initState();
    // fetchUserInfo();
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
    input = widget.userInfoInput;
    userInfoEditRequestModel.token = widget.userInfoInput.token!;
    userInfoEditRequestModel.name = widget.userInfoInput.user_id!.name;
    userInfoEditRequestModel.family = widget.userInfoInput.user_id!.family;
    // userInfoEditRequestModel.gender = widget.userInfoInput.user_id!.gender;
    userInfoEditRequestModel.email = widget.userInfoInput.user_id!.email;
    userInfoEditRequestModel.mainAddress =
        widget.userInfoInput.user_id!.main_address;
    userInfoEditRequestModel.nationalCode =
        widget.userInfoInput.user_id!.national_code;
    userInfoEditRequestModel.birthday = widget.userInfoInput.user_id!.birthday;
    userInfoEditRequestModel.foreignNational =
        widget.userInfoInput.user_id!.foreign_national;
    userInfoEditRequestModel.postalCode =
        widget.userInfoInput.user_id!.postal_code;
    userInfoEditRequestModel.telephone =
        widget.userInfoInput.user_id!.telephone;
    userInfoEditRequestModel.sosPhone = widget.userInfoInput.user_id!.sosPhone;
    /*userInfoEditRequestModel.name = userInfo.user_id!.name!;
    userInfoEditRequestModel.family = userInfo.user_id!.family!;
    userInfoEditRequestModel.gender = userInfo.user_id!.gender!.toString();
    userInfoEditRequestModel.email = userInfo.user_id!.email!;
    userInfoEditRequestModel.mainAddress = userInfo.user_id!.main_address!;
    userInfoEditRequestModel.nationalCode = userInfo.user_id!.national_code!;
    userInfoEditRequestModel.birthday = userInfo.user_id!.birthday!;
    userInfoEditRequestModel.foreignNational =
        userInfo.user_id!.foreign_national!;
    userInfoEditRequestModel.postalCode = userInfo.user_id!.postal_code!;
    userInfoEditRequestModel.telephone = userInfo.user_id!.telephone!;
    userInfoEditRequestModel.sosPhone = userInfo.user_id!.sosPhone!;*/
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
        child: Consumer<UserProvider>(
          builder: (context, value, child) {
            return Column(
              children: [
                // Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("نام"),
                      TextFormField(
                        initialValue: input.user_id!.name,
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
                        initialValue: input.user_id!.family!,
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
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('آقا'),
                              leading: Radio<int>(
                                value: 0,
                                groupValue: _genderRdaio,
                                onChanged: (int? value) {
                                  setState(() {
                                    _genderRdaio = value!;
                                    // userInfoEditRequestModel.gender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('خانم'),
                              leading: Radio<int>(
                                value: 1,
                                groupValue: _genderRdaio,
                                onChanged: (int? value) {
                                  setState(() {
                                    _genderRdaio = value!;
                                    // userInfoEditRequestModel.gender = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
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
                        initialValue: input.user_id!.email,
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
                        initialValue: input.user_id!.main_address,
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
                        initialValue: input.user_id!.national_code,
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
                        initialValue: input.user_id!.birthday,
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
                        initialValue: input.user_id!.foreign_national,
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
                        initialValue: input.user_id!.postal_code,
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
                        initialValue: input.user_id!.telephone,
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
                        initialValue: input.user_id!.sosPhone,
                        onChanged: (input) {
                          userInfoEditRequestModel.sosPhone = input;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
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
                  onPressed: () {
                    setState(() {
                      _isApiCallProcess = true;
                    });
                    updateUserInfo();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text("بروزرسانی اطلاعات"),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            );
          },
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
    apiService.editUserInfo(userInfoEditRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        _isApiCallProcess = false;
        Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
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
