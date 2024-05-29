import 'dart:io';

import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:bookly_app/features/home/presentation/widgets/dialog.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_button.dart';
import 'package:bookly_app/features/home/presentation/widgets/logout_button.dart';
import 'package:bookly_app/features/home/upload_cubit/upload_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
    required this.updateState,
  });
  final VoidCallback updateState;
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final AppPreferences appPreferences = getIt<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Welcome\n${appPreferences.getUserName()}',
              style: getRegulartextStyle(
                color: blackColor,
                fontSize: 26.sp,
              ).copyWith(fontFamily: 'Baloo Thambi 2'),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5.w,
                ),
                LogoutButton(appPreferences: appPreferences),
                SizedBox(
                  width: 7.w,
                ),
                HomePageButton(
                  widgetContent: UploadCubit.uploadedImage == null
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              AssetsData.yellowIcon,
                              height: 3.8.h,
                              width: 5.h,
                            ),
                            Icon(
                              Icons.arrow_upward_outlined,
                              color: whiteColor,
                              size: 20.sp,
                            ),
                          ],
                        )
                      : Container(
                          height: 3.8.h,
                          width: 5.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                  UploadCubit.uploadedImage!,
                                ),
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                  onTap: () {
                    showPopupDialog(
                      context,
                      onTapCamera: () async {
                        final picker = ImagePicker();
                        await picker
                            .pickImage(
                          source: ImageSource.camera,
                          imageQuality: 40,
                          maxHeight: 30.h,
                          maxWidth: 40.w,
                        )
                            .then((value) {
                          UploadCubit.uploadedImage = value?.path;
                          widget.updateState();
                          Navigator.pop(context);
                        });
                      },
                      onTapGallery: () async {
                        final picker = ImagePicker();
                        await picker
                            .pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 40,
                          maxHeight: 30.h,
                          maxWidth: 40.w,
                        )
                            .then((value) {
                          UploadCubit.uploadedImage = value?.path;
                          widget.updateState();
                          Navigator.pop(context);
                        });
                      },
                    );
                  },
                  text: 'upload',
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
