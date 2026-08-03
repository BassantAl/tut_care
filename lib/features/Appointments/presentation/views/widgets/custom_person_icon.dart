import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';

class CustomPersonIcon extends StatelessWidget {
  const CustomPersonIcon({
    super.key,
    this.radius = 24,
    this.iconSize = 22,
  });

  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
      child: Icon(
        Icons.person_outline,
        size: iconSize,
        color: AppColors.primary,
      ),
    );
  }
}