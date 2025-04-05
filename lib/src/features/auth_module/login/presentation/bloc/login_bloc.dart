import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/src/core/failure/failure.dart';
import 'package:movie_app/src/core/routes/routes_name.dart';
import 'package:movie_app/src/core/utils/enum/enums.dart';
import 'package:movie_app/src/features/auth_module/login/domain/entities/user_entity.dart';

import '../../domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase)
      : super(
          LoginInitial(
            postApiStatus: PostAPIStatus.initial,
          ),
        ) {
    on<LoginRequested>(onLoginRequested);
  }

  void onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(
      LoginLoading(
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
          LoginError(
            message: failure.message,
            postApiStatus: PostAPIStatus.error,
          ),
        );
      },
      (UserEntity userEntity) {
        emit(
          LoginSuccess(
            token: userEntity.token,
            postApiStatus: PostAPIStatus.success,
          ),
        );
        navigatorKey.currentState?.pushNamed(RoutesName.home);
      },
    );
  }
}
