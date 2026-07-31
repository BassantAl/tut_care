import 'package:go_router/go_router.dart';
import 'package:tut_care/features/auth/presentation/views/login_view.dart';

abstract class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LoginView();
        },
      ),
    ],
  );
}
