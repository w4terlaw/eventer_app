import 'dart:async';

// import 'package:eventer_app/core/error/failure.dart';
import 'package:eventer_app/app.dart';
import 'package:eventer_app/feature/auth/domain/use_cases/user_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_bloc.freezed.dart';
part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final UserLogin userLoginUseCase;

  UserLoginBloc({required this.userLoginUseCase})
      : super(const UserLoginState.initial()) {
    // LOGIN - get jwt
    on<_UserLogin>(_userLoginEvent);
  }

  FutureOr<void> _userLoginEvent(
      _UserLogin event, Emitter<UserLoginState> emit) async {
    emit(const UserLoginState.loading());

    final failureOrSuccess = await userLoginUseCase(
        UserLoginParams(email: event.email, password: event.password));

    failureOrSuccess.fold(
      (failure) => emit(UserLoginState.error(message: failure.getError())),
      (_) => navigatorKey.currentState?.pushReplacementNamed('/home'),
    );
  }

// String _mapFailure(Failure failure) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       return 'Не удалось подключиться к серверу';
//     case SocketFailure:
//       return 'Нет соединение с интернетом';
//     case UnauthorizedFailure:
//       return 'Неверный логин или пароль';
//     default:
//       return 'Unexpected Error';
//   }
// }
}
