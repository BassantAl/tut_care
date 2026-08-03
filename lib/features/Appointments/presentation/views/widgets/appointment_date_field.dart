import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tut_care/features/auth/presentation/views/widgets/custom_text_form_feild.dart';

class AppointmentDateField extends StatelessWidget {
  const AppointmentDateField({
    super.key,
    required this.date,
    required this.onTap,
  });

  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dateText = date == null ? '' : DateFormat('dd MMM yyyy').format(date!);

    return CustomTextFormFeild(
      title: 'Appointment Date',
      hintText: 'Select Date',
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(text: dateText),
      suffixIcon: const Icon(Icons.calendar_today_outlined),
    );
  }
}