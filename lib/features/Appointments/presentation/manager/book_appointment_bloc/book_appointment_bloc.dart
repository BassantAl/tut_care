import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/features/Appointments/data/models/book_appointment_request_model.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc
    extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  BookAppointmentBloc()
      : super(BookAppointmentInitial()) {
    final repo = getIt<AppointmentsRepo>();

    on<BookAppointmentRequested>((event, emit) async {
      emit(BookAppointmentLoading());

      final result = await repo.bookAppointment(
        event.request,
      );

      result.fold(
        (failure) => emit(
          BookAppointmentFailure(
            errorMessage: failure.errorMessage,
          ),
        ),
        (_) => emit(
          BookAppointmentSuccess(),
        ),
      );
    });
  }
}