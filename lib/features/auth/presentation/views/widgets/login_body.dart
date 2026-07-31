import 'package:flutter/material.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: const Column(
            children: [
              LoginHeader(),
              SizedBox(height: 30),
              CustomLoginForm()
            ],
          ),
        ),
        ),
    ));
  }
}