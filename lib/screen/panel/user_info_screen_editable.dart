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
  UserInfoEditRequestModel userInfoEditRequestModel = UserInfoEditRequestModel(
    token: '',
    /*company: UserInfoEditRequestCompany(
      name: 'AA',
      address: 'AA',
      economicCode: 'AA',
      nationalId: 'AA',
      postalCode: 'AA',
      registrationCode: 'AA',
      telephone: 'AA',
    ),*/
  );
  UserInfoData userInfo = UserInfoData();
  bool _isApiCallProcess = false;
  LoginData input = LoginData();
  String _genderRadio = "0";
  String _typeRadio = "true";
  GlobalKey<FormState> formKeyUserInfo = GlobalKey<FormState>();

  var textEditingControllerName = TextEditingController(text: '');
  var textEditingControllerFamily = TextEditingController(text: '');
  var textEditingControllerBirthDate = TextEditingController(text: '');
  var textEditingControllerGender = TextEditingController(text: '');
  var textEditingControllerEmail = TextEditingController(text: '');
  var textEditingControllerNationalCode = TextEditingController(text: '');
  var textEditingControllerForeignCode = TextEditingController(text: '');
  var textEditingControllerPostalCode = TextEditingController(text: '');
  var textEditingControllerLandLine = TextEditingController(text: '');
  var textEditingControllerSOS = TextEditingController(text: '');
  var textEditingControllerEconomicCode = TextEditingController(text: '');
  var textEditingControllerLat = TextEditingController(text: '');
  var textEditingControllerLon = TextEditingController(text: '');
  var textEditingControllerProvince = TextEditingController(text: '');
  var textEditingControllerCity = TextEditingController(text: '');
  var textEditingControllerAddress = TextEditingController(text: '');
  var textEditingControllerReal = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  @override
  void dispose() {
    textEditingControllerName.dispose();
    textEditingControllerFamily.dispose();
    textEditingControllerBirthDate.dispose();
    textEditingControllerGender.dispose();
    textEditingControllerEconomicCode.dispose();
    textEditingControllerNationalCode.dispose();
    textEditingControllerForeignCode.dispose();
    textEditingControllerPostalCode.dispose();
    textEditingControllerLandLine.dispose();
    textEditingControllerSOS.dispose();
    textEditingControllerEconomicCode.dispose();
    textEditingControllerLat.dispose();
    textEditingControllerLon.dispose();
    textEditingControllerProvince.dispose();
    textEditingControllerCity.dispose();
    textEditingControllerAddress.dispose();
    textEditingControllerReal.dispose();
    super.dispose();
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
    userInfoRequestModel.token = input.token!;
/*userInfoEditRequestModel.token = widget.userInfoInput.token!;
    userInfoEditRequestModel.name = input.user_id!.name;
    userInfoEditRequestModel.family = input.user_id!.family;
    userInfoEditRequestModel.birthday = input.user_id!.birthday;
    userInfoEditRequestModel.gender = input.user_id!.gender.toString();
    userInfoEditRequestModel.email = input.user_id!.email;
    userInfoEditRequestModel.nationalCode = input.user_id!.national_code;
    userInfoEditRequestModel.foreignNational = input.user_id!.foreign_national;
    userInfoEditRequestModel.postalCode = input.user_id!.postal_code;
    userInfoEditRequestModel.telephone = input.user_id!.telephone;
    userInfoEditRequestModel.sosPhone = input.user_id!.sosPhone;
    userInfoEditRequestModel.company!.economicCode =
        input.user_id!.company!.economic_code;
    userInfoEditRequestModel.lat = input.user_id!.lat;
    userInfoEditRequestModel.lon = input.user_id!.lon;
    userInfoEditRequestModel.province = input.user_id!.province;
    userInfoEditRequestModel.city = input.user_id!.city;
    userInfoEditRequestModel.mainAddress = input.user_id!.main_address;
    userInfoEditRequestModel.personal = input.user_id!.personal;*/

    textEditingControllerName.text = input.user_id!.name.toString();
    textEditingControllerFamily.text = input.user_id!.family.toString();
    textEditingControllerBirthDate.text = input.user_id!.birthday.toString();
    textEditingControllerGender.text = input.user_id!.gender.toString();
    textEditingControllerEmail.text = input.user_id!.email.toString();
    textEditingControllerNationalCode.text =
        input.user_id!.national_code.toString();
    textEditingControllerForeignCode.text =
        input.user_id!.foreign_national.toString();
    textEditingControllerPostalCode.text =
        input.user_id!.postal_code.toString();
    textEditingControllerLandLine.text = input.user_id!.telephone.toString();
    textEditingControllerSOS.text = input.user_id!.sosPhone.toString();
    textEditingControllerEconomicCode.text =
        input.user_id!.company!.economic_code.toString();
    textEditingControllerLat.text = input.user_id!.lat.toString();
    textEditingControllerLon.text = input.user_id!.lon.toString();
    textEditingControllerProvince.text = input.user_id!.province.toString();
    textEditingControllerCity.text = input.user_id!.city.toString();
    textEditingControllerAddress.text = input.user_id!.main_address.toString();
    textEditingControllerReal.text = input.user_id!.personal.toString();

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroller) => [
        const SliverAppBar(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Vazir',
          ),
          title: Text(
            "مشخصات کاربر",
          ),
          backgroundColor: Color(0xff28a745),
          snap: true,
          centerTitle: true,
          floating: true,
        ),
      ],
      body: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              return Form(
                key: formKeyUserInfo,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    // Province
                    UserInfoItem(
                      label: 'نام',
                      textEditingController: textEditingControllerName,
                    ),
                    UserInfoItem(
                      label: 'نام خانوادگی',
                      textEditingController: textEditingControllerFamily,
                    ),
                    // DatePicker(),
                    UserInfoItem(
                      label: 'تاریخ تولد',
                      textEditingController: textEditingControllerBirthDate,
                    ),
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
                                  leading: Radio<String>(
                                    value: "0",
                                    groupValue: _genderRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _genderRadio = value!;
                                        userInfoEditRequestModel.gender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('خانم'),
                                  leading: Radio<String>(
                                    value: "1",
                                    groupValue: _genderRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _genderRadio = value!;
                                        userInfoEditRequestModel.gender = value;
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
                    UserInfoItem(
                      label: 'پست الکترونیک',
                      textEditingController: textEditingControllerEmail,
                    ),
                    UserInfoItem(
                      label: 'کد ملی',
                      textEditingController: textEditingControllerNationalCode,
                    ),
                    UserInfoItem(
                      label: 'کد اتباع خارجه',
                      textEditingController: textEditingControllerForeignCode,
                    ),
                    UserInfoItem(
                      label: 'کد پستی',
                      textEditingController: textEditingControllerPostalCode,
                    ),
                    UserInfoItem(
                      label: 'تلفن ثابت',
                      textEditingController: textEditingControllerLandLine,
                    ),
                    UserInfoItem(
                      label: 'تلفن اضطراری',
                      textEditingController: textEditingControllerSOS,
                    ),
                    UserInfoItem(
                      label: 'کد اقتصادی',
                      textEditingController: textEditingControllerEconomicCode,
                    ),
                    UserInfoItem(
                      label: 'استان',
                      textEditingController: textEditingControllerProvince,
                    ),
                    UserInfoItem(
                      label: 'شهر',
                      textEditingController: textEditingControllerCity,
                    ),
                    UserInfoItem(
                      label: 'آدرس پیش فرض',
                      textEditingController: textEditingControllerAddress,
                    ),
                    UserInfoItem(
                      label: 'نوع حساب کاربری',
                      textEditingController: textEditingControllerReal,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("نوع حساب کاربری"),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text('حقیقی'),
                                  leading: Radio<String>(
                                    value: "true",
                                    groupValue: _typeRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _typeRadio = value!;
                                        userInfoEditRequestModel.personal =
                                            value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text('حقوقی'),
                                  leading: Radio<String>(
                                    value: "false",
                                    groupValue: _typeRadio,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _typeRadio = value!;
                                        userInfoEditRequestModel.personal =
                                            value;
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
                    const SizedBox(height: 60),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 4,
          // child: Text('ویرایش'),
          child: Icon(Icons.check),
          onPressed: () {
            if (formKeyUserInfo.currentState!.validate()) {
              setState(() {
                _isApiCallProcess = true;
              });
              updateUserInfo();
            }
          },
        ),
      ),
    );
  }

  Padding UserInfoItem({
    required String label,
    required TextEditingController textEditingController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.multiline,
        validator: (value) {
          if (value!.isEmpty) {
            return 'تکمیل این فیلد ضروری است';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: label,
          // label: Text('استان'),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          prefix: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
          ),
          // errorText: " نام استان حداقل دو حرف می باشد.",
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
        controller: textEditingController,
        // Update on the fly
        // onChanged: (_) => setState(() {}),
      ),
    );
  }

  fetchUserInfo() {
    setState(() {
      _isApiCallProcess = true;
    });
    apiService.userInfo(userInfoRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
        // Provider.of<UserProvider>(context, listen: false).setUser(userInfoEditRequestModel);
      },
    ).onError(
      (error, stackTrace) {
        print("OnError: $error");
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

  void updateUserInfo() {
    userInfoEditRequestModel.token = widget.userInfoInput.token!;
    userInfoEditRequestModel.name = textEditingControllerName.text;
    userInfoEditRequestModel.family = textEditingControllerFamily.text;
    userInfoEditRequestModel.birthday = textEditingControllerBirthDate.text;
    userInfoEditRequestModel.gender = textEditingControllerGender.text;
    userInfoEditRequestModel.email = textEditingControllerEmail.text;
    userInfoEditRequestModel.nationalCode =
        textEditingControllerNationalCode.text;
    userInfoEditRequestModel.foreignNational =
        textEditingControllerForeignCode.text;
    userInfoEditRequestModel.postalCode = textEditingControllerPostalCode.text;
    userInfoEditRequestModel.telephone = textEditingControllerLandLine.text;
    userInfoEditRequestModel.sosPhone = textEditingControllerSOS.text;
    /*userInfoEditRequestModel.company!.economicCode =
        textEditingControllerEconomicCode.text;*/
    userInfoEditRequestModel.lat = textEditingControllerLat.text;
    userInfoEditRequestModel.lon = textEditingControllerLon.text;
    userInfoEditRequestModel.province = textEditingControllerProvince.text;
    userInfoEditRequestModel.city = textEditingControllerCity.text;
    userInfoEditRequestModel.mainAddress = textEditingControllerAddress.text;
    userInfoEditRequestModel.personal = textEditingControllerReal.text;

    apiService.editUserInfo(userInfoEditRequestModel).then(
      (value) {
        setState(() {
          _isApiCallProcess = false;
        });
        Fluttertoast.showToast(
          msg: value.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          // fontSize: 16.0,
        );
        // Provider.of<UserProvider>(context, listen: false).setUser(userInfoEditRequestModel);
        dispose();
      },
    ).onError(
      (error, stackTrace) {
        print("OnError: $error");
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
