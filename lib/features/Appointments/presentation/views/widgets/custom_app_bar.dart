import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
  });

  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: AppStyles.bold28(context),
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      
      title: Text(
        title,
        style: AppStyles.medium20(context).copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}