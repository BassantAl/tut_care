import 'package:flutter/material.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';

class MyAppointmentsView extends StatelessWidget {
  const MyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(mobileLayout:(context)=> SizedBox(), tabletLayout: (context)=> SizedBox() ),
    );
  }
}