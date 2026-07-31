import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';

abstract class AppDecoration {
  static  InputDecoration decorationForTextInputFeild({required BuildContext context,required String hintText , Widget? suffixIcon}) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: AppStyles.regular16(context),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.inputFeildBorderColor,),
      ),
  
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.secondary,),
      ),
    );
  }
}

