import 'package:dartz/dartz.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/features/Appointments/data/models/available_doctor_model.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, List<MyAppointmentModel>>> getMYAppointments();
   Future<Either<Failure, List<AvailableDoctorModel>>> getDoctors();
}
