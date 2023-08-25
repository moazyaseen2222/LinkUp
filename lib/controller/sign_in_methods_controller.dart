import 'package:get/get.dart';
import 'package:link_up/view/screens/sign_in_with_google.dart';
import 'package:link_up/view/screens/sign_up_screen.dart';

class SignInMethodsController extends GetxController {
  signInWithGoogleButton() {
    Get.to( SignInWithGoogle());
  }

  Future<void> signInWithFacebook() async {
    ///
  }

  Future<void> signInWithAppel() async {
    ///
  }

  Future<void> signInWithPhoneNumber() async {
    ///
  }

  Future<void> goToSignUpScreen() async {
    Get.to(SignUpScreen());
  }
}
