import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: onTap,
      child: Text(
        'Confirm & Book Appointment',
        style: AppStyles.medium18(context).copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}