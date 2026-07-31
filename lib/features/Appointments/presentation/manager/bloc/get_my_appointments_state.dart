part of 'get_my_appointments_bloc.dart';

@immutable
sealed class GetMyAppointmentsState {}

final class GetMyAppointmentsInitial extends GetMyAppointmentsState {}

final class GetMyAppointmentsLoading extends GetMyAppointmentsState {}

final class GetMyAppointmentsSuccess extends GetMyAppointmentsState {
  GetMyAppointmentsSuccess({required this.myAppointments});
  final List<MyAppointmentModel> myAppointments;
}

final class GetMyAppointmentsFailure extends GetMyAppointmentsState {
  GetMyAppointmentsFailure({required this.errorMessage});
  final String errorMessage;
}
