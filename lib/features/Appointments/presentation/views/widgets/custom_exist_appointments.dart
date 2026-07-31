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
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBar(title: 'Appointments'),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final appointment = myAppointments[index];
              return _TappableAppointmentCard(
                appointment: appointment,
              );
            },
            childCount: myAppointments.length,
          ),
        ),

        const SliverToBoxAdapter(
          child: SizedBox(height: 24),
        ),
      ],
    );
  }
}

class _TappableAppointmentCard extends StatelessWidget {
  const _TappableAppointmentCard({
    required this.appointment,
  });

  final MyAppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: AppointmentCard(
        appointment: appointment,
      ),
    );
  }

  Future<void> _navigateToDetails(BuildContext context) async {
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