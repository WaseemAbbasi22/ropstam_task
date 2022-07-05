import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';
import 'package:ropstam_flutter_task/constants/app_colors.dart';
import 'package:ropstam_flutter_task/views/auth/login_vm.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.hintText,
    required this.errorText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.vm,
    required this.isPassword,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final LoginVm? vm;
  //

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // side: BorderSide(width: 5, color: AppColors.kWhiteColor)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.04,
            vertical: SizeConfig.screenHeight! * 0.005),
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            border: InputBorder.none,
            // suffixIconColor: AppColors.kGreyColor,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      vm!.isObscure ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.kGreyColor,
                    ),
                    onPressed: () {
                      vm!.isObscure = !vm!.isObscure;
                    })
                : null,
          ),
          obscureText: isPassword?vm!.isObscure:false,
        ),
      ),
    );
  }
}
