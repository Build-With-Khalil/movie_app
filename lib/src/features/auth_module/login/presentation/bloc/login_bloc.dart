import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/services/dio_client.dart';
import '../../../../../core/utils/enum/enums.dart';
import '../../data/repositories/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository = LoginRepository(DioClient(Dio()));
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChange);
    on<LoginApiCall>(_onLoginApiCall);
  }
  void _onEmailChange(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChange(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onLoginApiCall(LoginApiCall event, Emitter<LoginState> emit) async {
    Map<String, dynamic> data = {
      'email': state.email,
      'password': state.password,
    };
    emit(
      state.copyWith(
        postApiStatus: PostAPIStatus.loading,
      ),
    );
    await loginRepository.login(data).then((value) {
      if (value.token.isNotEmpty) {
        emit(
          state.copyWith(
            message: 'Login Successful',
            postApiStatus: PostAPIStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: 'Login Failed',
            postApiStatus: PostAPIStatus.error,
          ),
        );
      }
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
          message: error.toString(),
          postApiStatus: PostAPIStatus.error,
        ),
      );
    });
  }
}
