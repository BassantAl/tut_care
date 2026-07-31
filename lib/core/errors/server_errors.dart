import 'package:dio/dio.dart';
import 'package:tut_care/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage, this.statusCode});
  final int? statusCode;

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'connection timeout with API server',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No internet connection');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad certificate');
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request to API server was cancelled',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data,
        );
      default:
        return ServerFailure(
          errorMessage: e.message ?? 'Unexpected error occurred',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        statusCode: statusCode,
        errorMessage: response['error']['message'] ?? 'Oops there was an error',
      );
    } else if (statusCode == 404) {
      return ServerFailure(errorMessage: 'request not found');
    } else if (statusCode == 500) {
      return ServerFailure(errorMessage: 'internal server error');
    } else {
      return ServerFailure(errorMessage: 'Oops there was an error');
    }
  }
}