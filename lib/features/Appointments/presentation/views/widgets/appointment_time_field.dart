import 'package:flutter/material.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class AppointmentTimeField extends StatelessWidget {
  const AppointmentTimeField({
    super.key,
    required this.time,
    required this.onTap,
  });

  final TimeOfDay? time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final timeText = time == null ? '' : time!.format(context);

    return CustomTextFormFeild(
      title: 'Appointment Time',
      hintText: 'Select Time',
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(text: timeText),
      suffixIcon: const Icon(Icons.access_time_outlined),
    );
  }
}