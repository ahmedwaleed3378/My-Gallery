abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadErrorState extends UploadState {
  final String errorMsg;
  UploadErrorState(this.errorMsg);
}

class UploadSuccessState extends UploadState {


  UploadSuccessState();
}

class UploadLoadingState extends UploadState {}
