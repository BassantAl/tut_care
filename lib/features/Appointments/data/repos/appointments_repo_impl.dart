import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/core/services/api_service.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';

class AppointmentsRepoImpl implements AppointmentsRepo {
  AppointmentsRepoImpl({required this.apiService});
  final ApiService apiService;
  @override
  Future<Either<Failure, MyAppointmentModel>> getMYAppointments() async{
    try{
    var result =await   apiService.get(url: '/api/Patient/MyAppointments');
    MyAppointmentModel data=MyAppointmentModel.fromJson(result.data);
    return right(data);
    }on DioException catch(e){
      re
    }
  }
}