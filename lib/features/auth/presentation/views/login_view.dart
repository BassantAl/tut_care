import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: AdaptiveLayout(
          mobileLayout: (context) => LoginBody(),
          tabletLayout: (context) => LoginBody(),
        ),
      ),
    );
  }
}
