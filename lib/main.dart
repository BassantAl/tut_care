import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/core/routes/app_routes.dart';
import 'package:tut_care/core/theme/app_colors.dart';
import 'package:tut_care/my_bloc_observer.dart';

void main() {
  setupServiceLocator();
  Bloc.observer =  MyBlockObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
       theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor, appBarTheme:AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
      ) ),
    );
  }
}
