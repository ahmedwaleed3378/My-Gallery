import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> getGallery() async {
    emit(HomeLoadingState());
    var result = await homeRepo.getGallery();
    result.fold((failure) {
      emit(
        HomeErrorState(
          failure.errMsg,
        ),
      );
      return;
    }, (success) {
      emit(
        HomeSuccessState(
          data: success.data?.images ?? [],
        ),
      );
    });
  }
}
