import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final dbService = Get.find<FirestoreService>();
  final boxService = Get.find<BoxService>();
  final app = Get.find<AppController>();
  final pageController = PageCont.login;

  void action(BotMessage message) {
    switch (message.action) {
      case "LOGIN":
        app.reset();
        Get.toNamed(Routes.login);
        Get.find<AppController>().screen.value = Routes.login;
        break;
      case "GO_BACK":
        pageController.goBack();
        break;
      case "ENTER_USERNAME":
        TextCont.userId.text = message.input;
        break;
      case "ENTER_USERID":
        TextCont.username.text = message.input;
        break;
      case "ENTER_DEPARTMENT":
        TextCont.department.text = message.input;
        break;
      case "ENTER_PASSWORD":
        TextCont.password.text = message.input;
        break;
      case "NEXT_PAGE":
        app.reset();
        pageController.goNext();
        break;
      case "CHECK_DETAILS":
        signup();
        break;
    }
  }

  void signup() async {
    try {
      app.error.value = "";
      User usr = await dbService.registerUser(
        userID: TextCont.userId.text,
        username: TextCont.username.text,
        department: TextCont.department.text,
        password: TextCont.password.text,
      );
      boxService.saveUser(usr);
      Get.toNamed(Routes.reader);
    } catch (e) {
      app.error.value = "Unable to login";
    }
  }

  void checkDepartment() async {
    app.error.value = "";
    bool deptExists = await dbService.checkDepartment(TextCont.department.text);
    if (deptExists) {
      PageCont.login.goNext();
    } else {
      app.error.value = "Department not found";
    }
  }
}
