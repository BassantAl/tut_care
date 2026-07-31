import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:tut_care/core/constants/api_constant.dart';
import 'package:tut_care/core/services/api_service.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo.dart';
import 'package:tut_care/features/Appointments/data/repos/appointments_repo_impl.dart';
import 'package:tut_care/features/auth/data/repos/auth_repo.dart';
import 'package:tut_care/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(BaseOptions(baseUrl: ApiConstant.baseUrl)),
  );
  getIt.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  getIt.registerSingleton<ApiService>(
    ApiService(dio: getIt<Dio>(), storage: getIt<FlutterSecureStorage>()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerSingleton<AppointmentsRepo>(
    AppointmentsRepoImpl(apiService: getIt<ApiService>())
  );

}
