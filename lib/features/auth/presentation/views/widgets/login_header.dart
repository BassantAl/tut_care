import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
      'Welcome Back',
      style: AppStyles.bold28(
        context,
      ).copyWith(color: Color(0xff1A1B22)),
    ),
    const SizedBox(height: 10,),
    Text(
      'Sign in to manage your appointments and stay \n connected with your healthcare journey.',
      style: AppStyles.regular16(context),
      textAlign: TextAlign.center,
    ),
      ],
    );
  }
}