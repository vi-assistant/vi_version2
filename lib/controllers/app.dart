import 'package:vi_assistant/controllers/auth/login.dart';
import 'package:vi_assistant/controllers/auth/signup.dart';
import 'package:vi_assistant/controllers/auth/splash.dart';
import 'package:vi_assistant/controllers/reader/reader.dart';
import 'package:vi_assistant/controllers/utils/utils.dart';
import 'package:vi_assistant/repositories/llm_repository.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/controllers/utils/actions.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:get/get.dart';
import 'dart:async';

class AppController extends GetxController {
  final speechService = Get.find<SpeechService>();
  final llmService = Get.find<LLMService>();
  final llmRepo = LLMRepository();
  final isListening = false.obs;
  final lastWords = ''.obs;
  final _delay = const Duration(seconds: 1);
  Timer? _timer;

  // Globals
  RxString screen = Routes.splash.obs;
  RxString error = "".obs;

  @override
  void onInit() async {
    super.onInit();
    done("Hi");
    speechService.streamData.listen((data) {
      Get.log(data.liveResponse);
      if (data.liveResponse != lastWords.value) done(data.liveResponse);
      lastWords.value = data.liveResponse;
      isListening.value = data.isListening;
    });
  }

  void reset() {
    error.value = "";
    TextCont.username.text = "";
    TextCont.userId.text = "";
    TextCont.password.text = "";
    TextCont.department.text = "";
  }

  void done(String text) {
    _timer?.cancel();
    _timer = Timer(_delay, () async {
      if (text.isNotEmpty) {
        isListening.value = false;
        speechService.stopListening();
        llmService.loading.value = true;
        final resp = await llmRepo.respond(
          text,
          screen.value.substring(1).toUpperCase(),
          Actions.splash,
        );
        action(resp);
        await speechService.speak(resp.message);
        llmService.loading.value = false;
        isListening.value = true;
        speechService.startListening();
      }
      _timer = null;
    });
  }

  void action(BotMessage message) {
    switch (screen.value) {
      case Routes.splash:
        Get.find<SplashController>().action(message);
        break;
      case Routes.login:
        Get.find<LoginController>().action(message);
        break;
      case Routes.signup:
        Get.find<SignupController>().action(message);
        break;
      case Routes.reader:
        Get.find<ReaderController>().action(message);
        break;
    }
  }
}
