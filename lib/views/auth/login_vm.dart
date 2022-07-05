import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ropstam_flutter_task/data/models/post_model.dart';
import 'package:ropstam_flutter_task/data/base/base_vm.dart';
import 'package:ropstam_flutter_task/data/extentions.dart';
import 'package:ropstam_flutter_task/data/services/web_services.dart';
import 'package:ropstam_flutter_task/utilities/general_utilities.dart';

import '../../data/models/validation_model.dart';

class LoginVm extends BaseVm {
  bool _loading = false;
  bool _detectBtnClick = false;
  bool _isObscure = false;
  String _logInStatus = '';

  String get logInStatus => _logInStatus;

  set logInStatus(String value) {
    _logInStatus = value;
    notifyListeners();
  }

  bool get isObscure => _isObscure;



  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool get detectBtnClick => _detectBtnClick;

  set detectBtnClick(bool value) {
    _detectBtnClick = value;
    notifyListeners();
  }
  
  ValidationModel _userName = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  ValidationModel get userName => _userName;

  set userName(ValidationModel value) {
    _userName = value;
    notifyListeners();
  }

  ValidationModel get password => _password;

  set password(ValidationModel value) {
    _password = value;
    notifyListeners();
  }
  
  

  void validateUserName(String? val) {
    if (val != null && val.isValidUserName) {
      userName = ValidationModel(val, null);
    } else {
      userName = ValidationModel(null, 'Please Enter a Valid User Name');
    }
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      password = ValidationModel(val, null);
      print('I am in if Condition with firstName value ${password.value} ');
    } else {
      password = ValidationModel(null, 'Please Enter a Valid password (only Numbers)');
    }
    notifyListeners();
  }


  bool get validate {
    return _userName.value != null;
  }


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> logIn(BuildContext context) async {
    try {
      loading = true;
      var data = {
          // "email": "hassan.zafar@ropstam.com",
          // "password": "12345678",
          "email": userName.value,
          "password": password.value,
          "device_token": "zasdcvgtghnkiuhgfde345tewasdfghjkm"

      };
      print('body I am sending ...$data');
      var response = await WebService.post('login', data);
      if (response.statusCode == 200) {
        print("Success");
        var data = response.data;
        loading = false;
        logInStatus = response.data['meta']['message'];
        print('meta message value is $logInStatus');

        print('looged with data: $data');
      }
    } catch (e) {
      loading = false;
      GeneralUtilities.showMessage(
          context: context,
          title: "Error",
          text:
          "Server Error");

      print(e);
    }
  }


}
