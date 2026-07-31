part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {
  

  const LoginEvent();

  
}

final class LoginSubmitted extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  const LoginSubmitted({
   required this.loginRequestModel});
}