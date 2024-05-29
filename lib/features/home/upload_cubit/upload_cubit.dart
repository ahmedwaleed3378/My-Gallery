import 'package:bookly_app/data/repository/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit(this.homeRepo) : super(UploadInitial());
  final HomeRepo homeRepo;
  static String? uploadedImage;
  Future<void> upload(
    String img,
  ) async {
    emit(UploadLoadingState());
    var result = await homeRepo.uploadImage(
      img: img,
    );
    result.fold((failure) {
      emit(
        UploadErrorState(
          failure.errMsg,
        ),
      );
      return;
    }, (success) {
      emit(
        UploadSuccessState(),
      );
    });
  }
}
