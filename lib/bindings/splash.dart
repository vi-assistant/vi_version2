import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
