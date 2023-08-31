import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/constants/app_fonts.dart';
import 'package:link_up/constants/app_utils.dart';
import 'package:link_up/controller/sign_in_with_google_controller.dart';
import 'package:supabase/supabase.dart';

class SignInWithGoogle extends StatelessWidget {
  SignInWithGoogle({super.key});

  SignInWithGoogleController signInWithGoogleController =
      Get.put(SignInWithGoogleController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: true,
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            signInWithGoogleController.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: AppColors.mainColors,
                          ),
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              fontFamily: AppFonts.inter,
                              color: AppColors.mainColors),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        Text(
                          'LinkUp.',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ),
                        SizedBox(height: 40.h),

                        /// Email
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  /// Validate the email syntax and is not empty
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter the email !';
                                    }
                                    // Regular expression pattern for email validation
                                    final emailRegex = RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

                                    if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }

                                    return null;
                                  },

                                  ///

                                  controller: signInWithGoogleController
                                      .emailController,
                                  decoration: InputDecoration(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          'Enter your email',
                                          style: TextStyle(
                                              fontFamily: AppFonts.inter,
                                              fontSize: 14.sp,
                                              color: AppColors.formLabel),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      )),
                                ),
                                SizedBox(height: 15.h),

                                /// Password
                                Obx(() {
                                  return TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter the password !';
                                      }
                                      return null;
                                    },
                                    controller: signInWithGoogleController
                                        .passwordController,
                                    obscureText:
                                        signInWithGoogleController.isSeen.value,
                                    decoration: InputDecoration(
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: IconButton(
                                            onPressed: () {
                                              signInWithGoogleController
                                                  .changeVision();
                                            },
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              color: signInWithGoogleController
                                                      .isSeen.value
                                                  ? AppColors.mainColors
                                                  : AppColors.formLabel,
                                            ),
                                          ),
                                        ),
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15.w),
                                          child: Text(
                                            'Enter your password',
                                            style: TextStyle(
                                                fontFamily: AppFonts.inter,
                                                fontSize: 14.sp,
                                                color: AppColors.formLabel),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        )),
                                  );
                                })
                              ],
                            )),

                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.only(right: 200.0.w),
                          child: TextButton(
                              onPressed: () {
                                signInWithGoogleController.forgetPassword();
                              },
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                    fontFamily: AppFonts.inter,
                                    color: Colors.black),
                              )),
                        ),
                        SizedBox(height: 163.h),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainColors,
                              minimumSize: Size(319.w, 54.h),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const SpinKitCircle(
                                        color: AppColors.mainColors,
                                      );
                                    });

                                try {
                                  await signInWithGoogleController.signIn(
                                      email: signInWithGoogleController
                                          .emailController.text,
                                      password: signInWithGoogleController
                                          .passwordController.text);
                                  Future.delayed(
                                      const Duration(milliseconds: 600), () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      AppUtils.welcomeBack,
                                    );
                                  });
                                } catch (e) {
                                  if (e is AuthException) {
                                    Get.back();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: const Duration(seconds: 2),
                                          backgroundColor: Colors.red.shade400,
                                          content: Text(
                                            e.message ==
                                                    'Invalid login credentials'
                                                ? 'User not found'
                                                : e.message,
                                            style: const TextStyle(
                                              fontFamily: AppFonts.inter,
                                              color: Colors.white,
                                            ),
                                          )),
                                    );
                                  }
                                }
                              }
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(height: 30.h),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              signInWithGoogleController.goToSignUp();
                            },
                            child: Text(
                              'Sign up here',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: AppColors.mainColors),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
