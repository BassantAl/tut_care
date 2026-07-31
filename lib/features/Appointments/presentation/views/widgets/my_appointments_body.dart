import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/core/widgets/custom_error_widget.dart';
import 'package:tut_care/core/widgets/custom_loading_indicator.dart';
import 'package:tut_care/features/Appointments/presentation/manager/get_my_appointments_bloc/get_my_appointments_bloc.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_add_appointment.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_exist_appointments.dart';
import 'package:tut_care/features/Appointments/presentation/views/widgets/custom_no_appointments.dart';

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
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<GetMyAppointmentsBloc>().add(
                      MyAppointmentsEvent(),
                    );
              },
              child: state.myAppointments.isEmpty
                  ? const CustomNoAppoinments()
                  : CustomExistAppointments(
                      myAppointments: state.myAppointments,
                    ),
            ),
            bottomNavigationBar: SafeArea(
              minimum: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () => _navigateToBook(context),
                child: const CustomAddAppointment(),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Future<void> _navigateToBook(BuildContext context) async {
    final result = await GoRouter.of(context).push<bool>(
      AppRoutes.bookAppointment,
    );

    if (result == true && context.mounted) {
      context.read<GetMyAppointmentsBloc>().add(
            MyAppointmentsEvent(),
          );
    }
  }
}