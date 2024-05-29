import 'dart:ui';

import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/features/home/cubit/home_cubit.dart';
import 'package:bookly_app/features/home/upload_cubit/upload_cubit.dart';
import 'package:bookly_app/features/login/presentation/widgets/background_circle.dart';
import 'package:bookly_app/features/widgets/custom_button_tow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/background_gradient.dart';
import '../upload_cubit/upload_state.dart';
import 'widgets/gallery_list.dart';
import 'widgets/home_body.dart';
import 'widgets/r_p_s_custom_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _bind() async {
    await BlocProvider.of<HomeCubit>(context).getGallery();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackgroundCircle(
                topMargin: 15.h,
                leftMargin: -20.w,
                color: purple,
                width: 50.w,
                height: 30.h,
              ),
              const BackgroundGradient(),
              BackgroundCircle(
                topMargin: -20.h,
                leftMargin: 55.w,
                opacity: 1,
                color: primaryColor,
                width: 80.w,
                height: 75.h,
              ),
              Positioned(
                bottom: 18.h,
                left: 36.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem2,
                  height: 12.h,
                  width: 12.h,
                ),
              ),
              Positioned(
                bottom: 32.h,
                left: 37.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem3,
                  height: 32.h,
                  width: 32.h,
                ),
              ),
              Positioned(
                bottom: 45.h,
                left: 11.w,
                child: SvgPicture.asset(
                  AssetsData.loginBackgroundItem1,
                  height: 15.h,
                  width: 15.h,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15.0,
                  sigmaY: 15.0,
                ),
                child: Container(
                  color: whiteColor.withOpacity(0.38),
                ),
              ),
              Positioned(
                top: -20.h,
                right: -65.sp,
                child: ClipRect(
                  child: CustomPaint(
                    size: Size(
                      100.sp,
                      (100.sp * 0.8333333333333334).toDouble(),
                    ),
                    painter: RPSCustomPainter(),
                  ),
                ),
              ),
              Positioned(
                top: 2.h,
                right: 5.w,
                child: Container(
                  height: 30.sp,
                  width: 30.sp,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AssetsData.logo,
                      ),
                    ),
                  ),
                ),
              ),
              HomeBody(
                updateState: () {
                  setState(() {});
                },
              ),
              const GalleryList(),
              if (UploadCubit.uploadedImage != null)
                Positioned(
                  bottom: 5.h,
                  child: Row(
                    children: [
                      BlocProvider(
                        create: (context) => getIt<UploadCubit>(),
                        child: BlocConsumer<UploadCubit, UploadState>(
                          listener: (context, state) {
                            if (state is UploadSuccessState) {
                              setState(() {
                                UploadCubit.uploadedImage = null;
                              });
                              _bind();
                              Fluttertoast.showToast(
                                msg:
                                    'Your Image has been uploaded successfully',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 4,
                                backgroundColor: skyColor,
                                textColor: Colors.white,
                                fontSize: 17.sp,
                              );
                            }
                            if (state is UploadErrorState) {
                              Fluttertoast.showToast(
                                msg: state.errorMsg,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 4,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 17.sp,
                              );
                            }
                          },
                          builder: (context, state) {
                            return state is UploadLoadingState
                                ? const CircularProgressIndicator()
                                : CustomButtonTow(
                                    onPressed: () {
                                      BlocProvider.of<UploadCubit>(context)
                                          .upload(UploadCubit.uploadedImage!);
                                    },
                                    title: 'Upload',
                                    textColor: whiteColor,
                                    backGround: skyColor,
                                    width: 35.w,
                                  );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      CustomButtonTow(
                        onPressed: () {
                          setState(() {
                            UploadCubit.uploadedImage = null;
                          });
                        },
                        title: 'Remove',
                        textColor: whiteColor,
                        backGround: errorColor,
                        width: 35.w,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
