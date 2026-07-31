import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/core/widgets/custom_button.dart';

class BookAppointmentButton extends StatelessWidget {
  const BookAppointmentButton({
    super.key, this.onTap,
    
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomButton(
        child: Text(
          'Book Appointment',
          style: AppStyles.medium18(context),
        ),
      ),
    );
  }
}