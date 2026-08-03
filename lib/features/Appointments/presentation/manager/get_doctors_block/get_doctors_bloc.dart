import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

part 'get_doctors_event.dart';
part 'get_doctors_state.dart';

class GetDoctorsBloc extends Bloc<GetDoctorsEvent, GetDoctorsState> {
  GetDoctorsBloc() : super(GetDoctorsInitial()) {
    final repo = getIt<AppointmentsRepo>();

    on<DoctorsEvent>((event, emit) async {
      emit(GetDoctorsLoading());

      final result = await repo.getDoctors();

      result.fold(
        (failure) {
          emit(
            GetDoctorsFailure(
              errorMessage: failure.errorMessage,
            ),
          );
        },
        (doctors) {
          emit(
            GetDoctorsSuccess(
              doctors: doctors,
            ),
          );
        },
      );
    });
  }
}
