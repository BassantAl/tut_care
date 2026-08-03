import 'package:flutter/material.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_app_bar.dart';

class CustomNoAppointments extends StatelessWidget {
  const CustomNoAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar(title: 'My Appointments')),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.event_busy_outlined,
                    size: 64,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'No Appointments Yet',
                  style: AppStyles.medium20(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1A1B22),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'You do not have any scheduled appointments.\nBook your first appointment to get started.',
                  textAlign: TextAlign.center,
                  style: AppStyles.regular16(context).copyWith(
                    color: AppColors.neutral,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


