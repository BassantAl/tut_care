import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomEmailTextFeild(),
          const SizedBox(height: 20),
          CustomPasswordTextFeild(),
          const SizedBox(height: 50,),
          CustomLoginButtton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }
}
