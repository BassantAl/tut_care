import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: AppStyles.bold28(context).copyWith(
            color: const Color(0xff1A1B22),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Sign in to manage your appointments and stay\nconnected with your healthcare journey.',
          style: AppStyles.regular16(context).copyWith(
            color: AppColors.neutral,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}