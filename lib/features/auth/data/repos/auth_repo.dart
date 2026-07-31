import 'package:dartz/dartz.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/features/auth/data/models/login_request_model.dart';
import 'package:tut_care/features/auth/data/models/login_response_model.dart';


abstract class AuthRepo {
  Future<Either<Failure, LoginResponseModel>> loginRequest({required LoginRequestModel loginRequestModel});
}
