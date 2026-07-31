import 'package:flutter/material.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => BookAppointment(),
        tabletLayout: (context) => BookAppointment(),
      ),
    );
  }
}
