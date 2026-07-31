import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/Appointments/presentation/manager/bloc/get_my_appointments_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/my_appointments_body.dart';

class MyAppointmentsView extends StatelessWidget {
  const MyAppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMyAppointmentsBloc()..add(MyAppointmentsEvent()),
      child: Scaffold(
        body: SafeArea(
          child: AdaptiveLayout(
            mobileLayout: (context) => const MyAppointmentsBody(),
            tabletLayout: (context) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}
