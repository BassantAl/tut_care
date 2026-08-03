import 'package:flutter/material.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(),
                SizedBox(height: 36),
                CustomLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}