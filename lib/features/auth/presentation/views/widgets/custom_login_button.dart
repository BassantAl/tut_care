import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';
import 'package:tut_care/core/widgets/custom_loading_indicator.dart';
import 'package:tut_care/features/auth/presentation/manager/login_bloc/login_bloc.dart';

class CustomLoginButtton extends StatelessWidget {
  const CustomLoginButtton({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: state is LoginLoading ? null : onTap,
          child: CustomButton(
            child: state is LoginLoading
                ? CustomLoadingIndicator()
                : Text(
                    'Login',
                    style: AppStyles.medium20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
          ),
        );
      },
    );
  }
}
