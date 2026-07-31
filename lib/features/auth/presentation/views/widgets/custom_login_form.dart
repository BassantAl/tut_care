import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/widgets/custom_error_widget.dart';
import 'package:tut_care/features/auth/data/models/login_request_model.dart';
import 'package:tut_care/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_email_text_feild.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_login_button.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_password_text_feild.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRoutes.myAppointmentsView);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.secondary,
              content: CustomErrorWidget(errorMessage: state.errorMessage),
            ),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomEmailTextFeild(
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(height: 20),
            CustomPasswordTextFeild(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 50),
            CustomLoginButtton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<LoginBloc>().add(
                    LoginSubmitted(
                      loginRequestModel: LoginRequestModel(
                        email: email,
                        password: password,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
