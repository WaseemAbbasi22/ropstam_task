import 'package:flutter/material.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';


class CustomFormButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  var onTap;
  final Color color, textColor;

  CustomFormButton({
    required this.text,
    required this.onTap,
    required this.color,
    required this.height,
    required this.width,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          primary: color,
          textStyle: TextStyle(
              color: textColor,
              fontSize: SizeConfig.screenHeight! * 0.02,
              fontWeight: FontWeight.w500)),
    );
  }
}
