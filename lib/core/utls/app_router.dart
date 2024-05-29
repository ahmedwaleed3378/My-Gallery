import 'package:bookly_app/core/utls/transitions/page_transition.dart';
import 'package:bookly_app/features/home/cubit/home_cubit.dart';
import 'package:bookly_app/features/home/presentation/home_screen.dart';
import 'package:bookly_app/features/login/presentation/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/splash/presentation/views/splash_screen.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static const String homeViewPath = '/homeView';
  static const String splash = '/';
  static const String loginScreen = '/loginScreen';
  static Route<dynamic> getRoute(RouteSettings settings) {
    // AppPreferences appreferences = getIt<AppPreferences>();
    switch (settings.name) {
      case AppRouter.splash:
        return PageFadeTransition(
          const SplashView(),
        );
      case AppRouter.loginScreen:
        initLoginModule();
        return PageFadeTransition(
          const LoginScreen(),
        );
      case AppRouter.homeViewPath:
        initHomenModule();
        return PageFadeTransition(
          BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      default:
        return PageFadeTransition(
          const SplashView(),
        );
    }
  }
}
