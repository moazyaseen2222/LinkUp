import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:link_up/constants/app_utils.dart';
import 'package:supabase/supabase.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

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
                          onPressed: () {},
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
                          'Reset Password',
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

                                  controller: forgetPasswordController
                                      .emailTextController,

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
                      TextFormField(
                        // enabled: forgetPasswordController
                        //     .isEnabeld.value,

                        /// Trying to reset password

                        /// Validate the email syntax and is not empty
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter the the new password !';
                          }

                          return null;
                        },

                        controller: forgetPasswordController
                            .newPasswordController,

                        decoration: InputDecoration(
                            label: Padding(
                              padding: EdgeInsets.only(left: 15.w),
                              child: Text(
                                'New Password',
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
                              ],
                            )),

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
                                  await forgetPasswordController.sendCheck(
                                      forgetPasswordController
                                          .emailTextController.text);
                                  AppUtils.confirmYourEmail;
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
                                                ? 'Email not found'
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
                              'Send Email',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
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
