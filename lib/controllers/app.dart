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
  final recordedText = ''.obs;
  final _delay = const Duration(seconds: 2);
  Timer? _timer;

  // Globals
  RxString screen = "".obs;
  RxString error = "".obs;

  @override
  void onInit() async {
    super.onInit();
    screen.value = Routes.splash;
    done("Hi");
    speechService.streamData.listen((data) async {
      isListening.value ? recordedText.value = data.liveResponse : null;
      Get.log(recordedText.value);
      done(recordedText.value);
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
        llmService.loading.value = true;
        isListening.value = false;
        print("Calling for response");
        final resp = await llmRepo.respond(
          text,
          screen.value.substring(1).toUpperCase(),
          actionList(),
        );
        Get.log("Response: ${resp.action}, ${resp.input}, ${resp.message}");
        action(resp);
        speechService.speak(resp.message).then((_) {
          isListening.value = true;
        });
        recordedText.value = "";
        llmService.loading.value = false;
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

  List<String> actionList() {
    switch (screen.value) {
      case Routes.splash:
        return Actions.splash;
      case Routes.login:
        double? pg = PageCont.login.page;
        if (pg == null) {
          return Actions.login(0);
        } else {
          return Actions.login(pg.toInt());
        }
      case Routes.signup:
        double? pg = PageCont.signup.page;
        if (pg == null) {
          return Actions.signup(0);
        } else {
          return Actions.signup(pg.toInt());
        }
      case Routes.reader:
        double? pg = PageCont.reader.page;
        if (pg == null) {
          return Actions.reader(0);
        } else {
          return Actions.reader(pg.toInt());
        }
    }
    return [];
  }
}
