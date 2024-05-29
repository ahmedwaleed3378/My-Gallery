abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;
   LoginErrorState(this.errorMsg);
}

class LoginSuccessState extends LoginState {
}

class LoginLoadingState extends LoginState {}
