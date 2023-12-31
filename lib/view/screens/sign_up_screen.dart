import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:link_up/controller/sign_up_controller.dart';
import 'package:supabase/supabase.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../constants/app_utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

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
                            signUpController.back();
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
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ),
                        SizedBox(height: 40.h),

                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                /// Email
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
                                  controller: signUpController.emailController,
                                  decoration: InputDecoration(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          'Enter Gmail ',
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
                                SizedBox(height: 18.h),

                                /// Password
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter the password !';
                                    }
                                    return null;
                                  },
                                  controller:
                                      signUpController.passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove_red_eye,
                                            color: AppColors.formLabel,
                                          ),
                                        ),
                                      ),
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          'Enter Password',
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
                              ],
                            )),

                        SizedBox(height: 18.h),

                        /// Phone Number
                        // TextFormField(
                        //   controller: signUpController.phoneController,
                        //   obscureText: true,
                        //   keyboardType: TextInputType.phone,
                        //   decoration: InputDecoration(
                        //       label: Padding(
                        //         padding: EdgeInsets.only(left: 15.w),
                        //         child: Text(
                        //           'Enter Phone Number',
                        //           style: TextStyle(
                        //               fontFamily: AppFonts.inter,
                        //               fontSize: 14.sp,
                        //               color: AppColors.formLabel),
                        //         ),
                        //       ),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(8.r),
                        //       )),
                        // ),

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
                                  await signUpController.signUp(
                                      email:
                                          signUpController.emailController.text,
                                      password: signUpController
                                          .passwordController.text);
                                  Future.delayed(
                                      const Duration(milliseconds: 600), () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      AppUtils.confirmYourEmail,
                                    );
                                  });
                                } catch (e) {
                                  if (e is AuthException) {
                                    Get.back();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(AppUtils.tryAgain);
                                  }
                                }
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(height: 30.h),
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              signUpController.goToSignIn();
                            },
                            child: Text(
                              'Sign in here',
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
