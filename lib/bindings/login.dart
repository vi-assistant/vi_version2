import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
