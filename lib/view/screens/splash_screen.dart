import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/constants/app_fonts.dart';
import 'package:link_up/view/screens/sign_in.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(SignInScreen());
    });
    super.initState();
  }

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
