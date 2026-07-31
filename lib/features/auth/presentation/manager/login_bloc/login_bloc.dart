import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tut_care/core/di/service_locator.dart';
import 'package:tut_care/features/auth/data/models/login_request_model.dart';
import 'package:tut_care/features/auth/data/models/login_response_model.dart';
import 'package:tut_care/features/auth/data/repos/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repo = getIt<AuthRepo>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
     
       emit(LoginLoading());
      var result = await repo.loginRequest(
        loginRequestModel: event.loginRequestModel,
      );
      result.fold(
        (failure) {
          emit(LoginFailure(errorMessage: failure.errorMessage));
        },
        (result) {
          emit(LoginSuccess(loginResponseModel: result));
        },
      );
     
    });
  }
}
