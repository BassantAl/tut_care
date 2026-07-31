import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/core/errors/server_errors.dart';
import 'package:tut_care/core/services/api_service.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

class AppointmentsRepoImpl implements AppointmentsRepo {
  AppointmentsRepoImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, List<MyAppointmentModel>>> getMYAppointments() async {
    List<MyAppointmentModel> data = [];
    try {
      var result = await apiService.get(url: '/api/Patient/MyAppointments');
      List<dynamic> appointments = result.data as List<dynamic>;

       data = appointments.map(
        (e) => MyAppointmentModel.fromJson(e),
      ).toList();

      return right(data);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
  
  @override
Future<Either<Failure, List<AvailableDoctorModel>>> getDoctors() async {
  try {
    final result = await apiService.get(
      url: '/api/Patient/Doctors',
    );

    final List<dynamic> doctors = result.data as List<dynamic>;

    final data = doctors
        .map((e) => AvailableDoctorModel.fromJson(e))
        .toList();

    return right(data);
  } on DioException catch (e) {
    return left(ServerFailure.fromDioException(e));
  } catch (e) {
    return left(
      Failure(
        errorMessage: e.toString(),
      ),
    );
  }
}
}
