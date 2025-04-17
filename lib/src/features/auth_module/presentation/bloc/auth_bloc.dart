import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/main.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/params/login_params.dart';
import '../../../../core/params/sign_up_params.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/services/storage/token_storage.dart';
import '../../../../core/utils/enum/enums.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.loginUseCase, this.signUpUseCase)
      : super(
          AuthState(
            postApiStatus: PostAPIStatus.initial,
          ),
        ) {
    on<LoginRequested>(onLoginRequested);
    on<SignUpRequested>(onSignUpRequested);
  }

  void onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(postApiStatus: PostAPIStatus.loading),
    );
    final result = await loginUseCase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (Failure failure) {
        emit(
          state.copyWith(
            message: failure.message,
            postApiStatus: PostAPIStatus.error,
          ),
        );
      },
      (LoginEntity userEntity) {
        emit(state.copyWith(
          postApiStatus: PostAPIStatus.success,
          token: userEntity.token,
        ));
        TokenStorage.setToken(userEntity.token.toString());
        navigatorKey.currentState?.pushNamed(RoutesName.todoView);
      },
    );
  }

  void onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(postApiStatus: PostAPIStatus.loading),
    );
    final result = await signUpUseCase(
      SignUpParams(
        name: event.name,
        surName: event.surName,
        email: event.email,
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );
    result.fold(
      (Failure failure) {
        emit(
          state.copyWith(
            postApiStatus: PostAPIStatus.error,
            message: failure.message,
          ),
        );
      },
      (SignUpEntity userEntity) {
        emit(
          state.copyWith(
            message: '',
            postApiStatus: PostAPIStatus.success,
            token: userEntity.token,
          ),
        );
        navigatorKey.currentState?.pushNamed(RoutesName.login);
      },
    );
  }
}
