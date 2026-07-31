part of 'book_appointment_bloc.dart';

@immutable
sealed class BookAppointmentState {}

class BookAppointmentInitial
    extends BookAppointmentState {}

class BookAppointmentLoading
    extends BookAppointmentState {}

class BookAppointmentSuccess
    extends BookAppointmentState {}

class BookAppointmentFailure
    extends BookAppointmentState {
  final String errorMessage;

  BookAppointmentFailure({
    required this.errorMessage,
  });
}