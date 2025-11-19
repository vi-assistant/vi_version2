export 'auth/login.dart';
export 'utils/utils.dart';
export 'reader/reader.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/login.dart';
import 'package:vi_assistant/controllers/auth/signup.dart';
import 'package:vi_assistant/controllers/auth/splash.dart';
// import 'package:vi_assistant/controllers/reader/reader.dart';

void initControllers() {
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => SignupController());
}
