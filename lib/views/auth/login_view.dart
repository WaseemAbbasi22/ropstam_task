import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ropstam_flutter_task/views/auth/login_vm.dart';
import 'package:ropstam_flutter_task/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';
import 'package:ropstam_flutter_task/constants/app_colors.dart';
import 'package:ropstam_flutter_task/constants/app_strings.dart';
import 'package:ropstam_flutter_task/custom_widgets/rounded_button.dart';
import 'package:ropstam_flutter_task/custom_widgets/rounded_input_field.dart';
import 'package:ropstam_flutter_task/utilities/general_utilities.dart';

import '../../utilities/pref_utilities.dart';

class LogInView extends StatefulWidget {
  static const routeName = 'LogInView';

  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _formKey = GlobalKey<FormState>();

  // int _radioValue = 0;
  void clearControllerValue() {
    // TODO: implement dispose
    userNameController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<LoginVm>(
      builder: (context, loginVm, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.blue[50],
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.kGradientStartColor,
                // AppColors.kGradientCenterColor,
                AppColors.kGradientEndColor,
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.04,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! * 0.08),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.04,
                          ),
                          Center(
                            child: SizedBox(
                              width: SizeConfig.screenWidth! * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.loginFormHeading,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            SizeConfig.screenHeight! * 0.03),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * 0.018,
                                  ),
                                  Text(
                                    AppStrings.loginFormSubHeading,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            SizeConfig.screenHeight! * 0.022),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.04,
                          ),
                          // customLabel(AppStrings.firstName),
                          CustomFormField(
                            hintText: 'Enter username',
                            controller: userNameController,
                            errorText: loginVm.userName.error,
                            isPassword: false,
                            vm: loginVm,
                            // onChanged: (val) {
                            //   loginVm.validateFirstName(val);
                            // },
                          ),
                          // customLabel(AppStrings.lastName),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.028,
                          ),
                          CustomFormField(
                            hintText: 'Password',
                            vm: loginVm,
                            isPassword: true,
                            controller: passwordController,
                            errorText: loginVm.password.error,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: customLabel('Recovery Password'),
                              )),

                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                          CustomFormButton(
                            text: "Login",
                            onTap: () {
                              loginVm.detectBtnClick = true;
                              loginVm
                                  .validateUserName(userNameController.text);
                              loginVm.validatePassword(passwordController.text);
                              // loginVm.logIn(context);
                              // loginVm.getPosts(context);

                              if (
                                  loginVm.userName.value != null &&
                                  loginVm.password.value != null) {
                                EasyLoading.show();
                                loginVm
                                    .logIn(context)
                                    .whenComplete(() {
                                      if(loginVm.logInStatus=="Successfull"){
                                        EasyLoading.dismiss();
                                        PreferenceUtilities.setUserAuthStatusToPrefs(true, context);
                                        Navigator.pushReplacementNamed(context, HomeView.routeName);
                                        clearControllerValue();
                                      }
                                      else if(loginVm.logInStatus=="Password Not Matched"){
                                        EasyLoading.dismiss();
                                        GeneralUtilities.showMessage(
                                            context: context,
                                            title: "Error",
                                            text:
                                            "Password Not matched");
                                      }
                                      else{
                                        EasyLoading.dismiss();
                                        GeneralUtilities.showMessage(
                                            context: context,
                                            title: "Error",
                                            text:
                                            "User not Registered");
                                      }


                                 print('login status from provider is ${loginVm.logInStatus}');
                                });
                              } else {
                                GeneralUtilities.showMessage(
                                    context: context,
                                    title: "Error",
                                    text:
                                        "Please provide valid credentials.");
                              }
                            },
                            color: AppColors.kGreenColor,
                            textColor: AppColors.kWhiteColor,
                            height: SizeConfig.screenHeight! * 0.07,
                            width: SizeConfig.screenWidth! * 0.8,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.01,
                          ),
                          customLabel('or continue with'),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              socialLoginCard(
                                  iconPath: 'assets/images/google_icon.png',
                                  color: AppColors.kGradientStartColor),
                              socialLoginCard(
                                  iconPath: 'assets/images/apple_icon.png',
                                  color: AppColors.kGradientStartColor),
                              socialLoginCard(
                                  iconPath: 'assets/images/facebook_icon.png',
                                  color: AppColors.kGradientEndColor),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.03,
                          ),
                          RichText(
                            // Controls visual overflow
                            text: TextSpan(
                              text: AppStrings.notMember.split('?').first,
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppStrings.notMember.split('?').last,
                                    style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget customLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.02,
      ),
      child: Text(
        label,
        style: TextStyle(
            color: AppColors.kBlackColor,
            fontSize: SizeConfig.screenHeight! * 0.018,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget socialLoginCard({required String iconPath, required Color color}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenHeight! * 0.001),
        child: Card(
          color: color,
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // side: BorderSide(width: 5, color: AppColors.kWhiteColor)
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenHeight! * 0.01),
            child: Image.asset(
              iconPath,
              fit: BoxFit.contain,
              height: SizeConfig.screenHeight! * 0.04,
            ),
          ),
        ),
      ),
    );
  }
}
