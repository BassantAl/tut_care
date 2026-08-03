part of 'get_doctors_bloc.dart';

@immutable
sealed class GetDoctorsState {}

final class GetDoctorsInitial extends GetDoctorsState {}

final class GetDoctorsLoading extends GetDoctorsState {}

final class GetDoctorsSuccess extends GetDoctorsState {
  GetDoctorsSuccess({
    required this.doctors,
  });

  final List<AvailableDoctorModel> doctors;
}

final class GetDoctorsFailure extends GetDoctorsState {
  GetDoctorsFailure({
    required this.errorMessage,
  });

  final String errorMessage;
}
