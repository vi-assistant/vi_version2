import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final app = Get.find<AppController>();
  void action(BotMessage message) {
    switch (message.action) {
      case "SIGNUP":
        app.reset();
        Get.toNamed(Routes.signup);
        app.screen.value = Routes.signup;
        break;
      case "LOGIN":
        app.reset();
        Get.toNamed(Routes.login);
        app.screen.value = Routes.login;
        break;
    }
  }
}
