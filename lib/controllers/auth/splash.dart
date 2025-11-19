import 'package:vi_assistant/repositories/llm_repository.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/actions/actions.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  LLMRepository llmRepo = LLMRepository();
  final speechService = Get.find<SpeechService>();
  final RxBool isListening = false.obs;
  final RxString lastWords = ''.obs;

  Timer? _timer;
  final Duration _delay = const Duration(seconds: 1);

  @override
  void onInit() async {
    super.onInit();
    done("Hi");
    speechService.streamData.listen((data) {
      Get.log('Live: ${data.liveResponse}');
      if (data.liveResponse != lastWords.value) done(data.liveResponse);
      lastWords.value = data.liveResponse;
      isListening.value = data.isListening;
    });
  }

  void done(String text) {
    _timer?.cancel();
    _timer = Timer(_delay, () async {
      if (text.isNotEmpty) {
        isListening.value = false;
        speechService.stopListening();
        Get.find<LLMService>().loading.value = true;
        final resp = await llmRepo.respond(text, "SPLASH", Actions.splash);
        action(resp);
        await speechService.speak(resp.message);
        Get.find<LLMService>().loading.value = false;
        isListening.value = true;

        speechService.startListening();
      }
      _timer = null;
    });
  }

  void action(BotMessage message) {
    switch (message.action) {
      case "SIGNUP":
        Get.toNamed(Routes.signup);
        break;
      case "LOGIN":
        Get.toNamed(Routes.login);
        break;
    }
  }
}
