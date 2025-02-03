import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/src/core/services/storage/token_storage.dart';

import '../../../../../core/utils/enum/enums.dart';
import '../../data/repositories/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository = LoginRepository();

  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChange);
    on<LoginApiCall>(_onLoginApiCall);
    on<VisibleEye>(_toggleObscure);
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
    await loginRepository.login(data).then((value) async {
      if (kDebugMode) {
        print("Received Token: ${value.token}");
      } // Debug print

      if (value.token.isNotEmpty) {
        await TokenStorage.setToken(value.token);
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

  void _toggleObscure(VisibleEye event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        isObscure: !state.isObscure,
      ),
    );
  }
}
