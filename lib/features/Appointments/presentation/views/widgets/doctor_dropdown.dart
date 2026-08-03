import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_decoration.dart';
import 'package:tut_care/core/theme/app_styles.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Healthcare Provider',
          style: AppStyles.medium14(context).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<AvailableDoctorModel>(
          initialValue: value,
          decoration: AppDecoration.decorationForTextInputField(
            context: context,
            hintText: 'Select Doctor',
            suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
          ),
          items: doctors.map((doctor) {
            return DropdownMenuItem(
              value: doctor,
              child: Text(
                '${doctor.fullName} (${doctor.specialization})',
                style: AppStyles.medium16(context),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}