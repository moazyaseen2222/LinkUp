import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/constants/app_fonts.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

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
                            ///
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
                              fontFamily: AppFonts.firaSans,
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
                              fontFamily: AppFonts.firaSans,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontFamily: AppFonts.firaSans,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ),
                        SizedBox(height: 40.h),

                        /// Email
                        TextFormField(
                          decoration: InputDecoration(
                              label: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Enter your gmail address',
                                  style: TextStyle(
                                      fontFamily: AppFonts.firaSans,
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
                          obscureText: true,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: IconButton(
                                  onPressed: () {
                                    ///
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                    color: AppColors.formLabel,
                                  ),
                                ),
                              ),
                              label: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Enter your password',
                                  style: TextStyle(
                                      fontFamily: AppFonts.firaSans,
                                      fontSize: 14.sp,
                                      color: AppColors.formLabel),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              )),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.only(right: 200.0.w),
                          child: TextButton(
                              onPressed: () {
                                ///
                              },
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                    fontFamily: AppFonts.firaSans,
                                    color: Colors.black),
                              )),
                        ),
                        SizedBox(height: 163.h),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(319.w, 54.h),
                            ),
                            onPressed: () {
                              ///
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontFamily: AppFonts.firaSans,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                        SizedBox(height: 30.h),
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontFamily: AppFonts.firaSans,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {
                              ///
                            },
                            child: Text(
                              'Sign up here',
                              style: TextStyle(
                                  fontFamily: AppFonts.firaSans,
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
