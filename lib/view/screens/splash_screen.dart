import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/constants/app_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColors,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LinkUp',
            style: TextStyle(
                fontFamily: AppFonts.inter,
                color: Colors.white,
                fontSize: 50.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '.',
            style: TextStyle(
                fontFamily: AppFonts.inter,
                color: Colors.black,
                fontSize: 50.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}
