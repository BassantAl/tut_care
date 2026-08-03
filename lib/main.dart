import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/core/services/api_service.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/my_bloc_observer.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription<void> _sessionSubscription;

  @override
  void initState() {
    super.initState();
    _sessionSubscription = getIt<ApiService>().onSessionExpired.listen((_) {
      AppRoutes.router.go(AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _sessionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      ),
    );
  }
}
