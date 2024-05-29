abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMsg;
  HomeErrorState(this.errorMsg);
}

class HomeSuccessState extends HomeState {
  final List<String> data;

  HomeSuccessState({required this.data});
}

class HomeLoadingState extends HomeState {}
