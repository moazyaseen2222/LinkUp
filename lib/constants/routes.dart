import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:link_up/constants/app_routes.dart';

import '../view/screens/chat_screen.dart';
import '../view/screens/chats_screen.dart';
import '../view/screens/sign_in.dart';
import '../view/screens/sign_in_with_google.dart';
import '../view/screens/sign_up_profile.dart';
import '../view/screens/sign_up_screen.dart';
import '../view/screens/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoutes.signIn, page: () => SignInScreen()),
  GetPage(name: AppRoutes.signInWithGoogle, page: () => SignInWithGoogle()),
  GetPage(name: AppRoutes.signUp, page: () => SignUpScreen()),
  GetPage(name: AppRoutes.signUpProfile, page: () => const SignUpProfile()),
  GetPage(name: AppRoutes.chats, page: () => ChatsScreen()),
  GetPage(name: AppRoutes.chat, page: () => const ChatScreen()),
];
