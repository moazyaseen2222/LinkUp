import 'package:get/get.dart';
import 'package:link_up/constants/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatsController extends GetxController {
  logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogged', false);
    Get.offAllNamed(AppRoutes.signIn);
  }
}
