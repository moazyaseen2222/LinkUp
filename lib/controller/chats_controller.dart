import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/screens/sign_in_with_google.dart';

class ChatsController extends GetxController {
  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogged', false);
    Get.to(SignInWithGoogle());
  }
}
