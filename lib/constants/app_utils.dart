import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppUtils {
  static const SnackBar welcomeBack = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: AppColors.mainColors,
      content: Text(
        'Welcome back 😊',
        style: TextStyle(
          fontFamily: AppFonts.inter,
          color: Colors.white,
        ),
      ));

  static SnackBar userNoFound = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red.shade400,
      content: const Text(
        'User not found',
        style: TextStyle(
          fontFamily: AppFonts.inter,
          color: Colors.white,
        ),
      ));

  static SnackBar confirmYourEmail = const SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: AppColors.mainColors,
      content: Text(
        'Confirm your email',
        style: TextStyle(
          fontFamily: AppFonts.inter,
          color: Colors.white,
        ),
      ));

  static SnackBar tryAgain = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red.shade400,
      content: const Text(
        'Error, try agin',
        style: TextStyle(
          fontFamily: AppFonts.inter,
          color: Colors.white,
        ),
      ));

  static SnackBar defaultSnake = SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red.shade400,
      content: const Text(
        'Error, try agin',
        style: TextStyle(
          fontFamily: AppFonts.inter,
          color: Colors.white,
        ),
      ));
}

