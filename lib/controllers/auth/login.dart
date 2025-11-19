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

class LoginController extends GetxController {
  LLMRepository llmRepo = LLMRepository();
  final speechService = Get.find<SpeechService>();
  final pageController = PageCont.login;
  final RxString dta = ''.obs;
  final RxBool isListening = false.obs;
  final RxString lastWords = ''.obs;
  final RxString errorMessage = ''.obs;

  Timer? _timer;
  final Duration _delay = const Duration(seconds: 1);

  @override
  void onInit() async {
    super.onInit();
    print("Me!!!");
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
          "LOGIN",
          Actions.login(
            pageController.page == null ? 0 : pageController.page!.toInt(),
          ),
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
      case "SIGNUP":
        Get.toNamed(Routes.signup);
        break;
      case "GO_BACK":
        pageController.goBack();
        break;
      case "ENTER_USERID":
        TextCont.userId.text = message.input;
        break;
      case "ENTER_PASSWORD":
        TextCont.password.text = message.input;
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
    final db = Get.find<FirestoreService>();
    bool loggedIn = await db.loginUser(
      TextCont.userId.text,
      TextCont.password.text,
    );

    if (loggedIn) {
      Get.toNamed(Routes.reader);
    } else {
      errorMessage.value = "Error logging in";
    }
  }
}
