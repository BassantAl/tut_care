import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tut_care/core/theme/app_decoration.dart';

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
    return TextFormField(
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(
        text: date == null
            ? ''
            : DateFormat('dd MMM yyyy').format(date!),
      ),
      decoration: AppDecoration.decorationForTextInputFeild(
        context: context,
        hintText: 'Select Date',
        suffixIcon: const Icon(Icons.calendar_today),
      ),
    );
  }
}