import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_up/constants/app_routes.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../view/screens/forget_password.dart';

class SignInWithGoogleController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isSeen = true.obs;
  RxBool isLogged = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  back() {
    Get.offAllNamed(AppRoutes.signIn);
  }

  changeVision() {
    if (isSeen.value) {
      isSeen.value = false;
    } else {
      isSeen.value = true;
    }
  }

  forgetPassword() {
    Get.to(() =>  ForgetPasswordScreen());
  }

  Future signIn({required String email, required String password}) async {
    final supabase = Supabase.instance.client;

    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('isLogged', true);
      Get.offAllNamed(AppRoutes.chats);
      {}
    }
  }

  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUp);
  }
}
