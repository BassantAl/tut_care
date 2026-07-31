
import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:color?? AppColors.primary,
      ),
      child: Center(child: child),
    );
  }
}
