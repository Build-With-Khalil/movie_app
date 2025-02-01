import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../config/enum/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChange);
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
        email: event.password,
      ),
    );
  }
}
