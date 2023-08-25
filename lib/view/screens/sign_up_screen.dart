import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:link_up/controller/sign_up_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  SignUpController signUpController = Get.put(SignUpController());

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

                        /// Email
                        TextFormField(
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
                                borderRadius: BorderRadius.circular(8.r),
                              )),
                        ),
                        SizedBox(height: 18.h),

                        /// Password
                        TextFormField(
                          controller: signUpController.passwordController,
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
                                borderRadius: BorderRadius.circular(8.r),
                              )),
                        ),

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
                              await signUpController.signUp(
                                  email: signUpController.emailController.text,
                                  password:
                                      signUpController.passwordController.text);
                              // phone:
                              //     signUpController.passwordController.text);
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
