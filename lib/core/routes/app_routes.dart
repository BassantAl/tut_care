import 'package:go_router/go_router.dart';
import 'package:tut_care/features/Appointments/presentation/views/book_appointment.dart';
import 'package:tut_care/features/Appointments/presentation/views/my_appointments_view.dart';
import 'package:tut_care/features/auth/presentation/views/login_view.dart';

abstract class AppRoutes {
  static const String bookAppointment = '/bookAppointment';
  static const String myAppointmentsView = '/myAppointmentsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: myAppointmentsView,
        builder: (context, state) {
          return const MyAppointmentsView();
        },
      ),

      GoRoute(
        path: bookAppointment,
        builder: (context, state) {
          return const BookAppointment();
        },
      ),
    ],
  );
}
