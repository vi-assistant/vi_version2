export 'auth/auth.dart';
export 'utils/utils.dart';
export 'reader/reader.dart';
export 'app.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/app.dart';
import 'package:vi_assistant/controllers/auth/auth.dart';
import 'package:vi_assistant/controllers/reader/reader.dart';

void initControllers() {
  Get.put(AppController());
  Get.lazyPut(() => SplashController());
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => SignupController());
  Get.lazyPut(() => ReaderController());
}
