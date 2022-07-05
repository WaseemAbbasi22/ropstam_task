import 'package:flutter/material.dart';
import 'package:ropstam_flutter_task/utilities/pref_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtilities {
  // GET AND SET FOR AUTH STATUS
  static Future<void> getUserAuthStatusFromPrefsToProvider(
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('is_authenticated') != null) {
      // return prefs.getBool('is_authenticated');
      bool? authStatus = prefs.getBool('is_authenticated');
      setUserAuthStatusToPrefs(authStatus!, context);
    } else {
      setUserAuthStatusToPrefs(false, context);
    }
  }
  //PreferenceUtilities.clearAllPrefs(context);
  //                 Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);


  static Future<void> setUserAuthStatusToPrefs(bool authStatus,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_authenticated', authStatus);
    Provider.of<PreferencesProvider>(context, listen: false)
        .setUserAuthStatusInProvider(authStatus);
  }


  // GET AND SET FOR NAME
  static Future<void> getUserNameFromPrefsToProvider(
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('user_name') != null) {
      String? userName = prefs.getString('user_name');
      setUserNameToPrefs(userName!, context);
    } else {
      setUserNameToPrefs("", context);
    }
  }

  static Future<void> setUserNameToPrefs(String userName,
      BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_name', userName);
    Provider.of<PreferencesProvider>(context, listen: false)
        .setUserNameInProvider(userName);
  }
  static Future<void> clearAllPrefs(BuildContext context) async {

    Provider.of<PreferencesProvider>(context, listen: false).resetUsersData();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}