import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';

class CustomLoginButtton extends StatelessWidget {
  const CustomLoginButtton({super.key, this.onTap});

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      child: Text(
        'Login',
        style: AppStyles.medium20(context).copyWith(color: Colors.white),
      ),
    );
  }
}
