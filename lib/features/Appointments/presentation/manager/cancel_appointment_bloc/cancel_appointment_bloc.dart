import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

part 'cancel_appointment_event.dart';
part 'cancel_appointment_state.dart';

/// Handles appointment cancellation with optimistic UI update.
///
/// Flow:
///   1. User fires [CancelAppointmentRequested].
///   2. Bloc immediately emits [CancelAppointmentOptimistic] — UI shows
///      status = Cancelled without waiting for the server.
///   3. Network request runs in the background.
///   4a. Success → emit [CancelAppointmentSuccess] (keep optimistic state).
///   4b. Failure → emit [CancelAppointmentRollback] with the previous status
///       so the UI reverts and shows the backend error.
class CancelAppointmentBloc
    extends Bloc<CancelAppointmentEvent, CancelAppointmentState> {
  CancelAppointmentBloc() : super(CancelAppointmentInitial()) {
    final repo = getIt<AppointmentsRepo>();

    on<CancelAppointmentRequested>((event, emit) async {
      // Step 1: optimistic update — show "Cancelled" immediately.
      emit(CancelAppointmentOptimistic());

      // Step 2: call the server.
      final result = await repo.cancelAppointment(event.appointmentId);

      result.fold(
        (failure) {
          // Rollback: restore the previous status and surface the error.
          emit(
            CancelAppointmentRollback(
              previousStatus: event.previousStatus,
              errorMessage: failure.errorMessage,
            ),
          );
        },
        (_) {
          // Server confirmed — keep the optimistic state visible.
          emit(CancelAppointmentSuccess());
        },
      );
    });
  }
}
