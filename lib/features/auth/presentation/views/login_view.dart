import 'package:flutter/material.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(mobileLayout:(context)=> LoginBody(), tabletLayout: (context)=>LoginBody()),
    );
  }
}
