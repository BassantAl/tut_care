import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_decoration.dart';
import 'package:tut_care/core/theme/app_styles.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.title,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
  });

  final String hintText;
  final String title;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.medium14(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          onSaved: onSaved,
          controller: controller,
          obscureText: obscureText ?? false,
          validator: validator,
          decoration: AppDecoration.decorationForTextInputField(
            suffixIcon: suffixIcon,
            context: context,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
