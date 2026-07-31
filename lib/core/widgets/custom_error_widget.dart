import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage,style: AppStyles.medium18(context),);
  }
}


