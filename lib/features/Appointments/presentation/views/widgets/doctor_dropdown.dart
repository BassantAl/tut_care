import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_decoration.dart';

class DoctorDropdown extends StatelessWidget {
  const DoctorDropdown({
    super.key,
    required this.doctors,
    required this.value,
    required this.onChanged,
  });

  final List<String> doctors;
  final String? value;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: AppDecoration.decorationForTextInputFeild(
        context: context,
        hintText: 'Select Doctor',
      ),
      items: doctors
          .map(
            (doctor) => DropdownMenuItem(
              value: doctor,
              child: Text(doctor),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}