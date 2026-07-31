import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  ApiService({required this.dio, required this.storage}) {
    dio.interceptors.add(
      QueuedInterceptorsWrapper(onRequest: _onRequest, onError: _onError),
    );
  }

  final Dio dio;
  final FlutterSecureStorage storage;


  final StreamController<void> _sessionExpiredController =
      StreamController<void>.broadcast();

  Stream<void> get onSessionExpired => _sessionExpiredController.stream;

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == 401) {
      await storage.deleteAll();
      _sessionExpiredController.add(null);
    }
    handler.next(error);
  }

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: 'token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }


  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.get(url, queryParameters: queryParameters);
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.post(url, data: data, queryParameters: queryParameters);
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return dio.delete(url, data: data, queryParameters: queryParameters);
  }


  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> clearSession() async {
    await storage.deleteAll();
  }
}
