import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final pageController = PageCont.login;
  final app = Get.find<AppController>();
  final db = Get.find<FirestoreService>();
  final box = Get.find<BoxService>();

  void action(BotMessage message) {
    switch (message.action) {
      case "SIGNUP":
        app.reset();
        Get.toNamed(Routes.signup);
        app.screen.value = Routes.signup;
        break;
      case "GO_BACK":
        app.reset();
        pageController.goBack();
        break;
      case "ENTER_USERID":
        TextCont.userId.text = message.input;
        pageController.goNext();
        break;
      case "ENTER_PASSWORD":
        TextCont.password.text = message.input;
        pageController.goNext();
        break;
      case "NEXT_PAGE":
        pageController.goNext();
        break;
      case "CHECK_DETAILS":
        login();
        break;
    }
  }

  void login() async {
    app.error.value = "";
    try {
      User loggedIn = await db.loginUser(
        TextCont.userId.text,
        TextCont.password.text,
      );
      box.saveUser(loggedIn);
      Get.toNamed(Routes.reader);
    } catch (e) {
      app.error.value = "Unable to login";
    }
  }
}
