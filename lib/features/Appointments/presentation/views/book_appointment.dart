import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/Appointments/presentation/manager/get_doctors_block/get_doctors_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/book_appointment_body.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetDoctorsBloc()..add(DoctorsEvent()),
      child: Scaffold(
        body: AdaptiveLayout(
          mobileLayout: (context) => BookAppointmentBody(),
          tabletLayout: (context) => BookAppointmentBody(),
        ),
      ),
    );
  }
}
