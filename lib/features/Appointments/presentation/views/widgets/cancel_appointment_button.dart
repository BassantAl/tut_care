import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';
import 'package:tut_care/core/widgets/custom_loading_indicator.dart';
import 'package:tut_care/features/Appointments/presentation/manager/cancel_appointment_bloc/cancel_appointment_bloc.dart';


class CancelAppointmentButton extends StatelessWidget {
  const CancelAppointmentButton({
    super.key,
    required this.onTap,
    required this.isCancelled,
  });

  final VoidCallback onTap;

  
  final bool isCancelled;

  
  @override
Widget build(BuildContext context) {
  return BlocBuilder<CancelAppointmentBloc, CancelAppointmentState>(
    builder: (context, state) {
      final isLoading = state is CancelAppointmentOptimistic;

      return GestureDetector(
        onTap: isCancelled || isLoading ? null : onTap,
        child: CustomButton(
          color: isCancelled ? Colors.grey : Colors.red.shade400,
          child: isLoading
              ? const CustomLoadingIndicator()
              : Text(
                  isCancelled
                      ? 'Cancelled'
                      : 'Cancel Appointment',
                  style: AppStyles.medium18(context),
                ),
        ),
      );
    },
  );
}
}
