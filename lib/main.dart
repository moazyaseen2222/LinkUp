import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:link_up/view/screens/sign_up_screen.dart';
import 'package:link_up/view/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://tidtbxncflqjnojielnj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRpZHRieG5jZmxxam5vamllbG5qIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI5ODQxMzAsImV4cCI6MjAwODU2MDEzMH0.eXbO-LSUWcmecvIi_CzrlT2vvvcDfFzmRSjz30a9UTk',
  );
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
        return GetMaterialApp(
          home: SplashScreen(),
        );
      },
    );
  }
}
