import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tut_care/core/errors/failure.dart';
import 'package:tut_care/core/errors/server_errors.dart';
import 'package:tut_care/core/services/api_service.dart';
import 'package:tut_care/features/auth/data/models/login_request_model.dart';
import 'package:tut_care/features/auth/data/models/login_response_model.dart';
import 'package:tut_care/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.apiService});

  final ApiService apiService;
  

  @override
  Future<Either<Failure, LoginResponseModel>> loginRequest({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      Response result = await apiService.post(
        url: '/api/Auth/Login',
        data:loginRequestModel.toJson()
      );
      return right(LoginResponseModel.fromJson(result.data as Map<String, dynamic>));
    } on DioException catch (e) {
      final error = ServerFailure.fromDioException(e);
      return left(error);
    } catch (e) {
      final error = Failure(errorMessage: e.toString());
      return left(error);
    }
  }
}
