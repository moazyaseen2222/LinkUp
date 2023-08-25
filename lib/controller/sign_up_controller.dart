import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:link_up/view/screens/sign_in_with_google.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isSeen = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
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

  signUp({
    required String email,
    required String password,
  }) async {
    final supabase = Supabase.instance.client;

    final response =
        await supabase.auth.signUp(email: email, password: password);
    if (response.user != null) {
      Get.to(SignInWithGoogle());
      print('User Sign Up Tamam!');
    } else {
      print('User Sign Up No Tamam!');
    }
  }

  goToSignIn() {
    Get.to(SignInWithGoogle());
  }
}
