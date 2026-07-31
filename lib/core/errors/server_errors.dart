import 'package:dio/dio.dart';
import 'package:tut_care/core/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage, this.statusCode});
  final int? statusCode;

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timed out. Please check your internet.',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'No internet connection. Please try again.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: 'Request timed out while sending. Try again.',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: 'Server took too long to respond. Try again.',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'SSL certificate error.');
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request was cancelled.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data,
        );
      default:
        return ServerFailure(
          errorMessage: e.message ?? 'An unexpected error occurred.',
        );
    }
  }

  static String _extractMessage(dynamic response, String fallback) {
    if (response == null) return fallback;

    if (response is String && response.isNotEmpty) {
      return response;
    }

    if (response is Map<String, dynamic>) {
      if (response['message'] is String &&
          (response['message'] as String).isNotEmpty) {
        return response['message'] as String;
      }

      if (response['title'] is String &&
          (response['title'] as String).isNotEmpty) {
        return response['title'] as String;
      }


      if (response['errors'] is Map) {
        final errors = response['errors'] as Map;
        final messages = <String>[];
        for (final entry in errors.entries) {
          final value = entry.value;
          if (value is List) {
            messages.addAll(value.map((e) => e.toString()));
          } else {
            messages.add(value.toString());
          }
        }
        if (messages.isNotEmpty) return messages.join('\n');
      }


      if (response['error'] is String &&
          (response['error'] as String).isNotEmpty) {
        return response['error'] as String;
      }
    }

    return fallback;
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'Bad request. Please check your input.'),
        );

      case 401:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'Session expired. Please login again.'),
        );

      case 403:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'You do not have permission to perform this action.'),
        );

      case 404:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'The requested resource was not found.'),
        );

      case 409:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'Conflict: this action cannot be completed.'),
        );

      case 422:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'Validation failed. Please check your input.'),
        );

      case 500:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(response, 'Internal server error. Please try again later.'),
        );

      default:
        return ServerFailure(
          statusCode: statusCode,
          errorMessage: _extractMessage(
            response,
            'Unexpected server response (HTTP $statusCode).',
          ),
        );
    }
  }
}