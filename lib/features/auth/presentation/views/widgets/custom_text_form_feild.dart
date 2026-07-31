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
    this.controller, this.onSaved, this.onChanged,
  });
  final String hintText;
  final String title;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.medium14(context)),
        TextFormField(
          onChanged:onChanged ,
          onSaved: onSaved,
          controller: controller,
          obscureText: obscureText ?? false,
          validator: validator,
          decoration: AppDecoration.decorationForTextInputFeild(
            suffixIcon: suffixIcon,
            context: context,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
