import 'package:dartz/dartz.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, MyAppointmentModel>> getMYAppointments();
}
