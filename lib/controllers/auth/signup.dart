import 'dart:async';

import 'package:get/get.dart';
import 'package:vi_assistant/actions/actions.dart';
import 'package:vi_assistant/controllers/utils/page_cont.dart';
import 'package:vi_assistant/controllers/utils/text_cont.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/repositories/llm_repository.dart';
import 'package:vi_assistant/services/firestore_service.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/utils/utils.dart';

class SignupController extends GetxController {
  LLMRepository llmRepo = LLMRepository();
  final speechService = Get.find<SpeechService>();
  final pageController = PageCont.login;
  final RxBool isListening = false.obs;
  final RxString lastWords = ''.obs;
  final RxString errorMessage = ''.obs;

  Timer? _timer;
  final Duration _delay = const Duration(seconds: 1);

  @override
  void onInit() async {
    super.onInit();
    speechService.streamData.listen((data) {
      Get.log('Live: ${data.liveResponse}, Final Text: ${data.entireResponse}');
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
        final resp = await llmRepo.respond(
          text,
          "SIGNUP",
          Actions.login(pageController.page!.toInt()),
        );
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
      case "LOGIN":
        Get.toNamed(Routes.login);
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
        pageController.goNext();
        break;
      case "CHECK_DETAILS":
        Get.toNamed(Routes.reader);
        break;
    }
  }

  void signup() async {
    final db = Get.find<FirestoreService>();
    try {
      await db.registerUser(
        userID: TextCont.userId.text,
        username: TextCont.username.text,
        department: TextCont.department.text,
        password: TextCont.password.text,
      );
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}
