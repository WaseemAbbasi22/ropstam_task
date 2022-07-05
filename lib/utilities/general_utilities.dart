
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';
import 'package:ropstam_flutter_task/constants/app_colors.dart';

class GeneralUtilities {
  static int stringConversion(String string) {
    int value = int.parse(string.split(' ').first);
    return value;
  }

  static Widget loaderWidget() {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.028,
      width: SizeConfig.screenWidth! * 0.06,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.kLightGreySlideToolTipColor,
      ),
    );
  }

  static showMessage(
      {required BuildContext context,
      required String title,
      required String text}) {
    // return EasyLoading.showToast(
    //   title: title,
    //   message: text,
    //   duration: const Duration(seconds: 3),
    //   // backgroundGradient: const LinearGradient(colors: [
    //   //   Color(0xffFFA37C),
    //   //   Color(0xffFE7940),
    //   //   Color(0xffFF9A70),
    //   // ]),
    // );
    return EasyLoading.showToast(text,
        duration: const Duration(seconds: 3),
        toastPosition: EasyLoadingToastPosition.bottom);
  }
}
