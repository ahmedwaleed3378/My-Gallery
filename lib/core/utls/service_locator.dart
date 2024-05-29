import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:bookly_app/data/repository/home_repo.dart';
import 'package:bookly_app/data/repository/home_repo_implementation.dart';
import 'package:bookly_app/features/home/cubit/home_cubit.dart';
import 'package:bookly_app/features/home/upload_cubit/upload_cubit.dart';
import 'package:bookly_app/features/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_dio_services.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  var sharedPrefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPrefs);
  getIt.registerSingleton<AppPreferences>(AppPreferences(getIt()));
  getIt.registerSingleton<DioHelper>(DioHelper());
  getIt.registerSingleton<HomeRepo>(HomeRepoImplementation(getIt<DioHelper>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginCubit>()) {
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  }
}

initHomenModule() {
  if (!GetIt.I.isRegistered<HomeCubit>()) {
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  }
  if (!GetIt.I.isRegistered<UploadCubit>()) {
    getIt.registerFactory<UploadCubit>(() => UploadCubit(getIt()));
  }
}
