import 'package:flutter/material.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/book_appointment_body.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => BookAppointmentBody(),
        tabletLayout: (context) => BookAppointmentBody(),
      ),
    );
  }
}
