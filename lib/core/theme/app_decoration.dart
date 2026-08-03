import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';

abstract class AppDecoration {
  static InputDecoration decorationForTextInputField({
    required BuildContext context,
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: AppStyles.regular16(context).copyWith(
        color: AppColors.neutral.withValues(alpha: 0.6),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.inputFieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
      ),
    );
  }

  // Alias for backward compatibility
  static InputDecoration decorationForTextInputFeild({
    required BuildContext context,
    required String hintText,
    Widget? suffixIcon,
  }) =>
      decorationForTextInputField(
        context: context,
        hintText: hintText,
        suffixIcon: suffixIcon,
      );
}
