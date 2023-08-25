import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Container(
        height: 60.h,
        width: 340.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 0.5,
                spreadRadius: 0.5,
                offset: const Offset(1, 2),
              ),
            ]),
        child: Row(

          children: [
            SizedBox(width: 39.w),
            Image(
              width: 30.w,
                height: 30.h,
                image: AssetImage(image)),
          SizedBox(width: 40.w),
            Text(
              text,
              style: TextStyle(
                  fontFamily: AppFonts.inter,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
