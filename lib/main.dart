import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_up/view/screens/sign_in.dart';
import 'package:link_up/view/screens/sign_in_with_google.dart';
import 'package:link_up/view/screens/sign_up_profile.dart';
import 'package:link_up/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: SignUpProfile(),
        );
      },
    );
  }
}
