import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.color,
    this.onTap,
    this.height = 55,
    this.width,
    this.borderRadius = 16,
  });

  final Widget child;
  final Color? color;
  final VoidCallback? onTap;
  final double height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.primary;

     return Container(
  height: height,
  width: width ?? double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    color: buttonColor,
    boxShadow: onTap != null
        ? [
            BoxShadow(
              color: buttonColor.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
        : null,
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Center(child: child),
    ),
  ),
);
  }
}
