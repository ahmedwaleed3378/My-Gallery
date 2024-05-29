import 'dart:ui';

import 'package:bookly_app/core/utls/assets.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'pop_up_custom_button.dart';

void showPopupDialog(
  BuildContext context, {
  required VoidCallback onTapGallery,
  required VoidCallback onTapCamera,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SizedBox(
              height: 30.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PopUpCustomButton(
                    onTap: onTapGallery,
                    color: purple,
                    text: 'Gellary',
                    img: AssetsData.galleryIcon,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  PopUpCustomButton(
                    onTap: onTapCamera,
                    color: whiteColor,
                    text: 'Camera',
                    img: AssetsData.cameraIcon,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
