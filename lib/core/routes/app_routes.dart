import 'package:go_router/go_router.dart';
import 'package:tut_care/features/Appointments/data/models/my_appointment_model.dart';
import 'package:tut_care/features/Appointments/presentation/views/appointment_details_view.dart';
import 'package:tut_care/features/Appointments/presentation/views/book_appointment.dart';
import 'package:tut_care/features/Appointments/presentation/views/my_appointments_view.dart';
import 'package:tut_care/features/auth/presentation/views/login_view.dart';

abstract class AppRoutes {
  static const String login = '/';
  static const String myAppointmentsView = '/myAppointmentsView';
  static const String bookAppointment = '/bookAppointment';
  static const String appointmentDetails = '/appointmentDetails';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: login,
        builder: (context, state) => const LoginView(),
      ),

      GoRoute(
        path: myAppointmentsView,
        builder: (context, state) => const MyAppointmentsView(),
      ),

      GoRoute(
        path: bookAppointment,
        builder: (context, state) => const BookAppointment(),
      ),

      
      GoRoute(
        path: appointmentDetails,
        builder: (context, state) {
          final appointment = state.extra as MyAppointmentModel;
          return AppointmentDetailsView(appointment: appointment);
        },
      ),
    ],
  );
}
