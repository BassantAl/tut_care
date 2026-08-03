import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class CustomPasswordTextFeild extends StatefulWidget {
  const CustomPasswordTextFeild({super.key, this.onSaved});

  final Function(String?)? onSaved;

  @override
  State<CustomPasswordTextFeild> createState() =>
      _CustomPasswordTextFeildState();
}

class _CustomPasswordTextFeildState extends State<CustomPasswordTextFeild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.neutral,
        ),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password.';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters.';
        }
        return null;
      },
      title: 'Password',
      hintText: '••••••••',
    );
  }
}


