import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';

class CustomAddAppointment extends StatelessWidget {
  const CustomAddAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(child: Text(
                    'Add Appointment',
                    style: AppStyles.medium20(
                      context,
                    ).copyWith(color: Colors.white),
                  ),);
  }
}