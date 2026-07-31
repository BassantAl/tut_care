import 'package:flutter/material.dart';
import 'package:tut_care/core/utils/size_config.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < SizeConfig.tablet) {
          return mobileLayout(context);
        } else {
          return tabletLayout(context);
        }
      },
    );
  }
}
