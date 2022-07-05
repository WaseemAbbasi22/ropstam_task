import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';
import 'package:ropstam_flutter_task/constants/app_colors.dart';
import 'package:ropstam_flutter_task/views/auth/login_view.dart';
import 'package:ropstam_flutter_task/views/home/home_view.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/rounded_button.dart';
import '../../utilities/pref_provider.dart';
import '../../utilities/pref_utilities.dart';

class Splash extends StatefulWidget {
  static const routeName = 'splash_screen';

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    PreferenceUtilities.getUserAuthStatusFromPrefsToProvider(context);
    super.initState();
  }
  @override
  //
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.kGradientStartColor,
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: SizeConfig.screenHeight! * 0.2,
            // ),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/splash_illustration.svg',
                height: SizeConfig.screenHeight! * 0.4,
                width: SizeConfig.screenWidth!*0.8,
              ),
            ),
            // SizedBox(
            //   height: SizeConfig.screenHeight! * 0.2,
            // ),
            CustomFormButton(
              text: 'Get Started',
              onTap: () {
                if (Provider.of<PreferencesProvider>(context, listen: false).userAuthStatus) {
                  Navigator.pushNamed(context, HomeView.routeName);
                } else {
                  Navigator.pushNamed(context, LogInView.routeName);
                }
              },
              color: AppColors.kGreenColor,
              textColor: AppColors.kWhiteColor,
              height: SizeConfig.screenHeight! * 0.07,
              width: SizeConfig.screenWidth! * 0.8,
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
