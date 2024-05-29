import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.homeRepo) : super(LoginInitial());
  final HomeRepo homeRepo;
  Future<void> login({
    required String email,
    required String pass,
  }) async {
    emit(LoginLoadingState());
    var result = await homeRepo.login(
      email: email,
      password: pass,
    );
    result.fold((failure) {
      emit(
        LoginErrorState(
          failure.errMsg,
        ),
      );
      return;
    }, (success) {
      emit(LoginSuccessState());
    });
  }
}
