import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  final supabase = Supabase.instance.client;
  RxBool isEnabeld = false.obs;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    newPasswordController = TextEditingController();
    super.onInit();
  }

  Future sendCheck(String email) async {
    await supabase.auth.resetPasswordForEmail(email,
        redirectTo: 'http://example.com/account/update-password');
    isEnabeld.value = true;
  }

  Future setNewPassword(String password) async {
    // await supabase.auth.updateUser({password: new_password});
    await supabase.auth.updateUser(UserAttributes(password: password));
  }
}
