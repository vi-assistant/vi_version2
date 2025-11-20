export 'login.dart';
export 'signup.dart';
export 'splash.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/login.dart';
import 'package:vi_assistant/controllers/auth/signup.dart';
import 'package:vi_assistant/controllers/auth/splash.dart';

void initControllers() {
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => SignupController());
}
