import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/manager/cancel_appointment_bloc/cancel_appointment_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/cancel_appointment_button.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_person_icon.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/details_info_row.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/status_badge.dart';

class AppointmentDetailsBody extends StatefulWidget {
  const AppointmentDetailsBody({
    super.key,
    required this.appointment,
  });

  final MyAppointmentModel appointment;

  @override
  State<AppointmentDetailsBody> createState() => _AppointmentDetailsBodyState();
}

class _AppointmentDetailsBodyState extends State<AppointmentDetailsBody> {
 
  late int _displayedStatus;

  @override
  void initState() {
    super.initState();
    _displayedStatus = widget.appointment.status;
  }

  void _onCancelTap() {
    context.read<CancelAppointmentBloc>().add(
          CancelAppointmentRequested(
            appointmentId: widget.appointment.id,
            previousStatus: _displayedStatus,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelAppointmentBloc, CancelAppointmentState>(
      listener: (context, state) {
        if (state is CancelAppointmentOptimistic) {
          setState(() => _displayedStatus = 3);
        }

        if (state is CancelAppointmentSuccess) {
          GoRouter.of(context).pop(true);
        }

        if (state is CancelAppointmentRollback) {
          setState(() => _displayedStatus = state.previousStatus);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red.shade400,
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.errorMessage,
                style: AppStyles.medium16(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AppointmentDetailsHeader(
                appointment: widget.appointment,
                displayedStatus: _displayedStatus,
              ),

              const SizedBox(height: 28),
              const Divider(),
              const SizedBox(height: 20),

              _AppointmentDetailsInfo(appointment: widget.appointment),

              const SizedBox(height: 32),

              CancelAppointmentButton(
                onTap: _onCancelTap,
                isCancelled: _displayedStatus == 4,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


class _AppointmentDetailsHeader extends StatelessWidget {
  const _AppointmentDetailsHeader({
    required this.appointment,
    required this.displayedStatus,
  });

  final MyAppointmentModel appointment;
  final int displayedStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomPersonIcon(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.doctor.id.toString(),
                style: AppStyles.medium20(context).copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                appointment.doctor.specialization,
                style: AppStyles.medium14(context).copyWith(
                  color: AppColors.neutral,
                ),
              ),
            ],
          ),
        ),
        StatusBadge(status: displayedStatus),
      ],
    );
  }
}

class _AppointmentDetailsInfo extends StatelessWidget {
  const _AppointmentDetailsInfo({required this.appointment});

  final MyAppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('dd MMM yyyy').format(appointment.appointmentDate);
    final time = DateFormat('hh:mm a').format(appointment.appointmentDate);
    final notes =
        (appointment.notes?.isNotEmpty ?? false) ? appointment.notes! : '—';

    return Column(
      children: [
        DetailsInfoRow(
          icon: Icons.calendar_today_outlined,
          label: 'Date',
          value: date,
        ),
        const SizedBox(height: 20),
        DetailsInfoRow(
          icon: Icons.access_time_outlined,
          label: 'Time',
          value: time,
        ),
        const SizedBox(height: 20),
        DetailsInfoRow(
          icon: Icons.medical_services_outlined,
          label: 'Specialization',
          value: appointment.doctor.specialization,
        ),
        const SizedBox(height: 20),
        DetailsInfoRow(
          icon: Icons.notes_outlined,
          label: 'Notes',
          value: notes,
        ),
      ],
    );
  }
}
