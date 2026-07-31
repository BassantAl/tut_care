class BookAppointmentRequestModel {
  final int doctorId;
  final DateTime appointmentDate;

  const BookAppointmentRequestModel({
    required this.doctorId,
    required this.appointmentDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "doctorId": doctorId,
      "appointmentDate": appointmentDate.toIso8601String(),
    };
  }
}