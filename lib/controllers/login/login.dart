import 'package:get/get.dart';
import 'package:vi_assistant/controllers/utils/page_cont.dart';
import 'package:vi_assistant/services/services.dart';

class LoginController extends GetxController {
  final pageController = PageCont.login;
  final speechService = SpeechService();
}
