import 'package:get/get.dart';
import 'package:vi_assistant/controllers/login/login.dart';

export 'login/login.dart';
export 'utils/utils.dart';

void initControllers() {
  Get.put(LoginController());
}