
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ropstam_flutter_task/constants/app_constants.dart';
import 'package:ropstam_flutter_task/constants/app_strings.dart';
import 'package:ropstam_flutter_task/utilities/connectivity_utilities.dart';
import 'package:ropstam_flutter_task/utilities/general_utilities.dart';

class WebService{
  static Future<dynamic> post(String url, data) async {
    //TODO replace with session token
    try {
      print('data in post method is $data}');
      var responce = await Dio().post(
          AppStrings.postBaseUrl + url,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          data: data);
      return _getResponse(responce);
    } catch (e) {
      print(e);
    }
  }
  static Future<dynamic> get(
//
      String url,

      ) async {

    try {

      var response = await Dio().get(

        AppStrings.getBaseUrl + url,

        options: Options(

          followRedirects: false,

          receiveDataWhenStatusError: true,

          sendTimeout: 60 * 1000,

          receiveTimeout: 60 * 1000,

          validateStatus: (status) {

            return status! <= 500;

          },

        ),

      );

      print(response.statusCode);

      return _getResponse(response);

    } catch (e) {

      print(e);

    }

  }
  static dynamic _getResponse(response) {

    switch (response.statusCode) {

      case 200:

        return response;

      case 400:

        return 'Bad request.';

      case 401:

        return 'User Not Registered';

      case 403:

        return 'Forbidden by server';

      case 404:

        return 'Requested resource not found';

      default:

        return 'Could not connect to server';

    }

  }


}