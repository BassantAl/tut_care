
import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';

class CustomPersonIcon extends StatelessWidget {
  const CustomPersonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: AppColors.primary.withOpacity(.1),
      child: const Icon(
        Icons.person,
        color: AppColors.primary,
      ),
    );
  }
}