import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/utils/size_config.dart';

class AppStyles {
  AppStyles._();
  static TextStyle bold38(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontsize(fontsize: 38, context: context),
      color: AppColors.primary,
    );
  }

  static TextStyle bold28(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontsize(fontsize: 28, context: context),
      color: AppColors.primary,
    );
  }

  static TextStyle regular16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontsize(fontsize: 16, context: context),
      color: AppColors.smallText,
    );
  }

  static TextStyle medium14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontsize(fontsize: 14, context: context),
      color: AppColors.smallText,
    );
  }

  static TextStyle medium16(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontsize(fontsize: 16, context: context),
      color: AppColors.smallText,
    );
  }

  static TextStyle medium18(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontsize(fontsize: 18, context: context),
      color: Colors.white,
    );
  }

  static TextStyle medium20(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontsize(fontsize: 20, context: context),
      color: AppColors.smallText,
    );
  }

  static TextStyle bold14(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontsize(fontsize: 14, context: context),
      color: AppColors.primary,
    );
  }
}

double getResponsiveFontsize({
  required double fontsize,
  required BuildContext context,
}) {
  double responsiveFontSize = fontsize * getScaleFactor(context);

  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 500;
  } else {
    return width / 1000;
  }
}
