import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/manager/get_my_appointments_bloc/get_my_appointments_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/appointment_card.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_app_bar.dart';

class CustomExistAppointments extends StatelessWidget {
  const CustomExistAppointments({
    super.key,
    required this.myAppointments,
  });

  final List<MyAppointmentModel> myAppointments;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: CustomAppBar(title: 'My Appointments'),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final appointment = myAppointments[index];
                  return AppointmentCard(
                    appointment: appointment,
                    onTap: () => _navigateToDetails(context, appointment),
                  );
                },
                childCount: myAppointments.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToDetails(
    BuildContext context,
    MyAppointmentModel appointment,
  ) async {
    final result = await GoRouter.of(context).push<bool>(
      AppRoutes.appointmentDetails,
      extra: appointment,
    );

    if (result == true && context.mounted) {
      context.read<GetMyAppointmentsBloc>().add(
            MyAppointmentsEvent(),
          );
    }
  }
}