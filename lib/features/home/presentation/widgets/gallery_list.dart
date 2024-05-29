import 'dart:ui';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/features/home/cubit/home_cubit.dart';
import 'package:bookly_app/features/home/cubit/home_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GalleryList extends StatelessWidget {
  const GalleryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 27.h,
      child: SizedBox(
        height: 70.h,
        width: 85.w,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state is HomeSuccessState
                ? GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.h,
                      crossAxisSpacing: 3.w,
                    ),
                    itemBuilder: (context, index) => Card(
                      elevation: 12.sp,
                      color: primaryColor,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: state.data[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(
                            Icons.image,
                          ),
                        ),
                      ),
                    ),
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}