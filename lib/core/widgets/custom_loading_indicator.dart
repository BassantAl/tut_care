import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
     return const Center(
      child: CircularProgressIndicator(
       color: AppColors.neutral,
       backgroundColor: AppColors.secondary,
              ),
    );
  }
}