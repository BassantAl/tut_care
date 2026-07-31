import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_decoration.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';

class DoctorDropdown extends StatelessWidget {
  const DoctorDropdown({
    super.key,
    required this.doctors,
    required this.value,
    required this.onChanged,
  });

  final List<AvailableDoctorModel> doctors;
  final AvailableDoctorModel? value;
  final ValueChanged<AvailableDoctorModel?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<AvailableDoctorModel>(
      value: value,
      decoration: AppDecoration.decorationForTextInputFeild(
        context: context,
        hintText: 'Select Doctor',
      ),
      items: doctors.map((doctor) {
        return DropdownMenuItem(
          value: doctor,
          child: Text(
            '${doctor.fullName} (${doctor.specialization})',
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}