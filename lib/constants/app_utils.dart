import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppUtils {
  static const SnackBar welcomeBackSnakBar = SnackBar(
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
}
