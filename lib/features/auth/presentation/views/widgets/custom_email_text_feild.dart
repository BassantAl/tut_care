import 'package:flutter/material.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class CustomEmailTextFeild extends StatelessWidget {
  const CustomEmailTextFeild({
    super.key,
    this.onSaved,
  });

  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFeild(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your email.';
        } else if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email address.';
        }
        return null;
      },
      title: 'Email Address',
      hintText: 'name@example.com',
    );
  }
}


