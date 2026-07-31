class MyAppointmentModel {
  final int id;
  final int doctorId;
  final int patientId;
  final DateTime appointmentDate;
  final String? notes;
  final int status;
  final String? medicalDocumentPath;
  final DoctorModel doctor;
  final PatientModel patient;

  MyAppointmentModel({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.appointmentDate,
    required this.notes,
    required this.status,
    required this.medicalDocumentPath,
    required this.doctor,
    required this.patient,
  });

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentModel(
      id: json['id'],
      doctorId: json['doctorId'],
      patientId: json['patientId'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      notes: json['notes'],
      status: json['status'],
      medicalDocumentPath: json['medicalDocumentPath'],
      doctor: DoctorModel.fromJson(json['doctor']),
      patient: PatientModel.fromJson(json['patient']),
    );
  }
}

class DoctorModel {
  final int id;
  final String specialization;
  final bool isActive;
  final String userId;

  DoctorModel({
    required this.id,
    required this.specialization,
    required this.isActive,
    required this.userId,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      specialization: json['specialization'],
      isActive: json['isActive'],
      userId: json['userId'],
    );
  }
}

class PatientModel {
  final int id;
  final DateTime dateOfBirth;
  final String userId;

  PatientModel({
    required this.id,
    required this.dateOfBirth,
    required this.userId,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      userId: json['userId'],
    );
  }
}