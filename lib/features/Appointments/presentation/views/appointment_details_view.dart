import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/adaptive_layout.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/manager/cancel_appointment_bloc/cancel_appointment_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/appointment_details_body.dart';


class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({
    super.key,
    required this.appointment,
  });

  final MyAppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CancelAppointmentBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Appointment Details',
            style: AppStyles.medium20(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const _BackButton(),
        ),
        body: AdaptiveLayout(
          mobileLayout: (context) =>
              AppointmentDetailsBody(appointment: appointment),
          tabletLayout: (context) =>
              AppointmentDetailsBody(appointment: appointment),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      color: AppColors.primary,
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
