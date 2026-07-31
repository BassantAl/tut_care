part of 'cancel_appointment_bloc.dart';

@immutable
sealed class CancelAppointmentState {}

final class CancelAppointmentInitial extends CancelAppointmentState {}

final class CancelAppointmentOptimistic extends CancelAppointmentState {}


final class CancelAppointmentSuccess extends CancelAppointmentState {}

final class CancelAppointmentRollback extends CancelAppointmentState {
  CancelAppointmentRollback({
    required this.previousStatus,
    required this.errorMessage,
  });

  final int previousStatus;
  final String errorMessage;
}
