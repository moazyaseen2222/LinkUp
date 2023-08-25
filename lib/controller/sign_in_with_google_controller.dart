import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:link_up/constants/app_colors.dart';
import 'package:link_up/view/screens/chats_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInWithGoogleController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isSeen = false.obs;

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
    Get.back();
  }

  changeVision() {
    if (isSeen.value) {
      isSeen.value = false;
    } else {
      isSeen.value = true;
    }
  }

  forgetPassword() {}

  Future signIn({required String email, required String password}) async {



    final supabase = Supabase.instance.client;

    // Call the signIn method with email and password
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      Get.to(ChatsScreen());
      print('User Login Tamam!');
    } else {
      print('User Login No Tamam!');
    }
  }

  goToSignUp() {}
}
