class AvailableDoctorModel {
  final int id;
  final String fullName;
  final String specialization;

  const AvailableDoctorModel({
    required this.id,
    required this.fullName,
    required this.specialization,
  });

  factory AvailableDoctorModel.fromJson(Map<String, dynamic> json) {
    return AvailableDoctorModel(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      specialization: json['specialization'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'specialization': specialization,
    };
  }
}