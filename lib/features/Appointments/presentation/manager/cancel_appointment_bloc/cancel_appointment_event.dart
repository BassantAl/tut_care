part of 'cancel_appointment_bloc.dart';

@immutable
sealed class CancelAppointmentEvent {}

class CancelAppointmentRequested extends CancelAppointmentEvent {
  CancelAppointmentRequested({
    required this.appointmentId,
    required this.previousStatus,
  });

  final int appointmentId;
  final int previousStatus;
}
