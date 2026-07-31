import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/widgets/custom_error_widget.dart';
import 'package:tut_care/core/widgets/custom_loading_indicator.dart';
import 'package:tut_care/features/Appointments/presentation/manager/bloc/get_my_appointments_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/appointment_card.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_add_appointment.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_app_bar.dart';

class MyAppointmentsBody extends StatelessWidget {
  const MyAppointmentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMyAppointmentsBloc, GetMyAppointmentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetMyAppointmentsLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }

        if (state is GetMyAppointmentsFailure) {
          return Center(
            child: CustomErrorWidget(
              errorMessage: state.errorMessage,
            ),
          );
        }

        if (state is GetMyAppointmentsSuccess) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<GetMyAppointmentsBloc>().add(
                 MyAppointmentsEvent(),
              );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: CustomAppBar(
                    title: 'Appointments',
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return AppointmentCard(
                        appointment: state.myAppointments[index],
                      );
                    },
                    childCount: state.myAppointments.length,
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),

                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CustomAddAppointment(),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}