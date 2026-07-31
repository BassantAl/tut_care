part of 'book_appointment_bloc.dart';

@immutable
sealed class BookAppointmentEvent {}

class BookAppointmentRequested
    extends BookAppointmentEvent {
  final BookAppointmentRequestModel request;

  BookAppointmentRequested({
    required this.request,
  });
}