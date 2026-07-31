class LoginResponseModel {
  final String token;
  final String user;
  final String email;
  final List<String> roles;
  LoginResponseModel({
    required this.token,
    required this.user,
    required this.email,
    required this.roles,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> data) {
    return LoginResponseModel(
      token: data['token'] ?? '',
      user: data['user'] ?? '',
      email: data['email'] ?? '',
      roles: List<String>.from(data['roles'] ?? const []),
    );
  }
}
