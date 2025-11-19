import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/signup.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
