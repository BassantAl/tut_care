import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  ApiService({required this.dio, required this.storage}) {
    dio.interceptors.add(
      QueuedInterceptorsWrapper(onRequest: _onRequest, onError: _onError),
    );
  }

  Future _onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      await storage.delete(key: 'token');
    }
    handler.next(error);
  }

  Future _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: 'token');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  final Dio dio;
  final FlutterSecureStorage storage;
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.get(url, queryParameters: queryParameters);
    return result;
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    return result;
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response result = await dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    return result;
  }

  Future<void> saveToken(String token) async {
  await storage.write(
    key: 'token',
    value: token,
  );
}
}
