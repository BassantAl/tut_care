import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_person_icon.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/status_badge.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  final MyAppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPersonIcon(),
            const SizedBox(width: 16),
    
            Expanded(
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doctor ${appointment.doctor.id}',
                    style: AppStyles.medium20(context).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
    
                  const SizedBox(height: 6),
                  Text(
                    appointment.doctor.specialization,
                    style: AppStyles.medium14(context).copyWith(
                      color: AppColors.neutral,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
    
                      Expanded(
                        child: Text(
                          DateFormat(
                            'dd MMM yyyy • hh:mm a',
                          ).format(appointment.appointmentDate),
                          style: AppStyles.regular16(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            StatusBadge(
              status: appointment.status,
            ),
          ],
        ),
      ),
    );
  }
}
