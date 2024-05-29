import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:bookly_app/core/utls/app_router.dart';
import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  AppPreferences appPreferences = getIt<AppPreferences>();

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        await Future.wait([
          precachePicture(
            ExactAssetPicture(
              SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
              AssetsData.loginBackgroundItem1,
            ),
            null,
          ),
          precachePicture(
            ExactAssetPicture(
              SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
              AssetsData.loginBackgroundItem2,
            ),
            null,
          ),
          precachePicture(
            ExactAssetPicture(
              SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
              AssetsData.loginBackgroundItem3,
            ),
            null,
          ),
          precachePicture(
            ExactAssetPicture(
              SvgPicture.svgStringDecoderOutsideViewBoxBuilder,
              AssetsData.loginBackgroundItem4,
            ),
            null,
          ),
        ]).then((value) {
          if (appPreferences.isUserLoggedIn()) {
            Navigator.of(context).pushReplacementNamed(
              AppRouter.homeViewPath,
            );
          } else {
            Navigator.of(context).pushReplacementNamed(
              AppRouter.loginScreen,
            );
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('$imgPath/logo.png'),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
