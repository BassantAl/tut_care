import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

part 'get_my_appointments_event.dart';
part 'get_my_appointments_state.dart';

class GetMyAppointmentsBloc
    extends Bloc<GetMyAppointmentsEvent, GetMyAppointmentsState> {
  GetMyAppointmentsBloc() : super(GetMyAppointmentsInitial()) {
    final repo = getIt<AppointmentsRepo>();
    on<MyAppointmentsEvent>((event, emit) async {
      emit(GetMyAppointmentsLoading());
      var result = await repo.getMYAppointments();
      result.fold(
        (failure) {
          emit(GetMyAppointmentsFailure(errorMessage: failure.errorMessage));
        },
        (result) {
          emit(GetMyAppointmentsSuccess(myAppointments: result));
        },
      );
    });
  }
}
