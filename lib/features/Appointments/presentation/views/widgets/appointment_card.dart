import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_person_icon.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/status_badge.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onTap,
  });

  final MyAppointmentModel appointment;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPersonIcon(radius: 26, iconSize: 24),
              const SizedBox(width: 14),
              Expanded(
                child: _AppointmentCardContent(appointment: appointment),
              ),
              const SizedBox(width: 8),
              StatusBadge(status: appointment.status),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppointmentCardContent extends StatelessWidget {
  const _AppointmentCardContent({required this.appointment});

  final MyAppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Doctor ID: ${appointment.doctor.id}',
          style: AppStyles.medium18(context).copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xff1A1B22),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          appointment.doctor.specialization,
          style: AppStyles.medium14(context).copyWith(
            color: AppColors.neutral,
          ),
        ),
        const SizedBox(height: 12),
        _AppointmentDateRow(date: appointment.appointmentDate),
      ],
    );
  }
}

class _AppointmentDateRow extends StatelessWidget {
  const _AppointmentDateRow({required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 16,
          color: AppColors.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            DateFormat('dd MMM yyyy • hh:mm a').format(date),
            style: AppStyles.regular16(context).copyWith(
              fontSize: 14,
              color: const Color(0xff374151),
            ),
          ),
        ),
      ],
    );
  }
}
