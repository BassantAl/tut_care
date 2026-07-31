import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/core/theme/app_styles.dart';
import 'package:tut_care/features/Appointments/presentation/manager/get_my_appointments_bloc/get_my_appointments_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_add_appointment.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_app_bar.dart';

class CustomNoAppoinments extends StatelessWidget {
  const CustomNoAppoinments({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar(title: 'Appointments')),

        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.event_busy_outlined,
                  size: 80,
                  color: AppColors.primary,
                ),

                const SizedBox(height: 20),

                Text(
                  'No Appointments Yet',
                  style: AppStyles.medium20(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                Text(
                  'You do not have any appointments yet.\nBook your first appointment to get started.',
                  textAlign: TextAlign.center,
                  style: AppStyles.regular16(
                    context,
                  ).copyWith(color: AppColors.neutral),
                ),

                const SizedBox(height: 32),

                GestureDetector(
                  onTap: () => _navigateToBook(context),
                  child: const CustomAddAppointment(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _navigateToBook(BuildContext context) async {
    final result = await GoRouter.of(context).push<bool>(
      AppRoutes.bookAppointment,
    );

    if (result == true && context.mounted) {
      context.read<GetMyAppointmentsBloc>().add(MyAppointmentsEvent());
    }
  }
}
