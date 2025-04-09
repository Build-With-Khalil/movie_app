import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/features/auth_module/domain/entities/login_entity.dart';
import 'package:movie_app/src/features/auth_module/domain/usecases/sign_up_use_case.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/params/login_params.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/utils/enum/enums.dart';
import '../../domain/usecases/login_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthBloc(this.loginUseCase, this.signUpUseCase)
      : super(
          AuthInitial(
            postApiStatus: PostAPIStatus.initial,
          ),
        ) {
    on<LoginRequested>(onLoginRequested);
  }

  void onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(
      AuthLoading(
        postApiStatus: PostAPIStatus.loading,
      ),
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
          AuthError(
            message: failure.message,
            postApiStatus: PostAPIStatus.error,
          ),
        );
      },
      (LoginEntity userEntity) {
        emit(
          AuthSuccess(
            token: userEntity.token!,
            postApiStatus: PostAPIStatus.success,
          ),
        );
        navigatorKey.currentState?.pushNamed(RoutesName.home);
      },
    );
  }
}
