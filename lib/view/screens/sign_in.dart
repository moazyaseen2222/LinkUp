import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/constants/app_fonts.dart';
import 'package:link_up/view/widget/signInButton.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: Column(
              children: [
                /// Label
                Text(
                  'LinkUp.',
                  style: TextStyle(
                      fontFamily: AppFonts.firaSans,
                      fontWeight: FontWeight.bold,
                      fontSize: 60.sp,
                      color: Colors.black),
                ),

                /// Sign in with
                SizedBox(height: 70.h),
                const SignInButton(
                  image: 'images/google.png',
                  text: 'Sign in with Google',
                ),
                const SignInButton(
                  image: 'images/facebook.png',
                  text: 'Sign in with Facebook',
                ),
                const SignInButton(
                  image: 'images/apple.png',
                  text: 'Sign in with Apple',
                ),

                /// or
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 25.w,
                        indent: 40.w,
                        thickness: 1,
                      ),
                    ),
                    const Text(
                      'or',
                      style: TextStyle(fontFamily: AppFonts.firaSans),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        endIndent: 40.w,
                        indent: 25.w,
                        thickness: 1,
                      ),
                    )
                  ],
                ),

                ///continue
                SizedBox(height: 30.h),
                Container(
                  height: 60.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: const Offset(1, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(7.r),
                  ),
                  child: Center(
                    child: Text(
                      'Continue with phone number',
                      style: TextStyle(
                          fontFamily: AppFonts.firaSans,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 70.h),
                Text(
                  'Aleady have an account?',
                  style: TextStyle(
                      fontFamily: AppFonts.firaSans,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 7.h),

                Text(
                  'Sign up here',
                  style: TextStyle(
                      fontFamily: AppFonts.firaSans,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.mainColors),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
