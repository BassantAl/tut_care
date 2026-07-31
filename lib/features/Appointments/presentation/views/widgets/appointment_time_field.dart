import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_decoration.dart';

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
    return TextFormField(
      readOnly: true,
      onTap: onTap,
      controller: TextEditingController(
        text: time == null ? '' : time!.format(context),
      ),
      decoration: AppDecoration.decorationForTextInputFeild(
        context: context,
        hintText: 'Select Time',
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}