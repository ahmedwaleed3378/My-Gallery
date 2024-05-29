import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:bookly_app/core/utls/app_router.dart';
import 'package:bookly_app/core/utls/color_manager.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/core/utls/styles.dart';
import 'package:bookly_app/features/login/cubit/login_cubit.dart';
import 'package:bookly_app/features/widgets/custom_button_tow.dart';
import 'package:bookly_app/features/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 4.w,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Log In',
              style: getBoldtextStyle(
                color: black2,
                fontSize: 27.sp,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomAuthFormFiled(
              controller: _emailController,
              width: 80.w,
              validator: (p0) {
                if (p0!.isEmpty && !p0.contains('@')) {
                  return 'Please enter your email';
                }
                return null;
              },
              borderColor: transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
              keyboardType: TextInputType.emailAddress,
              hintText: 'User Name',
              hintColor: lightGrey2,
              radius: 50,
              backgroundColor: whiteColor,
              textColor: lightGrey2,
              labelColor: lightGrey2,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomAuthFormFiled(
              controller: _passController,
              width: 80.w,
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Password should be more than 5 characters';
                }
                return null;
              },
              borderColor: transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
              keyboardType: TextInputType.visiblePassword,
              hintText: 'Password',
              hintColor: lightGrey2,
              radius: 50,
              backgroundColor: whiteColor,
              obscureText: true,
              textColor: lightGrey2,
              labelColor: lightGrey2,
            ),
            SizedBox(
              height: 5.h,
            ),
            BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    _emailController.dispose();
                    _passController.dispose();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouter.homeViewPath,
                      (route) => false,
                    );
                  }
                  if (state is LoginErrorState) {
                    ArtSweetAlert.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        dialogDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                        ),
                        type: ArtSweetAlertType.danger,
                        title: "Oops... Error",
                        text: state.errorMsg,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state is LoginLoadingState
                      ? CircularProgressIndicator(
                          color: whiteColor,
                          strokeWidth: 8.sp,
                        )
                      : CustomButtonTow(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                email: _emailController.text,
                                pass: _passController.text,
                              );
                            }
                          },
                          title: 'Submit',
                          textColor: whiteColor,
                          backGround: skyColor,
                          width: 80.w,
                          height: 6.h,
                        );
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
