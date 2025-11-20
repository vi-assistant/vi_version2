import 'dart:async';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/utils/actions.dart';
import 'package:vi_assistant/controllers/utils/page_cont.dart';
import 'package:vi_assistant/controllers/utils/text_cont.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/repositories/llm_repository.dart';
import 'package:vi_assistant/services/firestore_service.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/utils/utils.dart';

class ReaderController extends GetxController {
  final llmRepo = LLMRepository();
  final speechService = Get.find<SpeechService>();
  final dbService = Get.find<FirestoreService>();
  final pageController = PageCont.reader;
  final RxInt pageIndex = 0.obs;
  final RxString dta = ''.obs;
  final RxBool isListening = false.obs;
  final RxString lastWords = ''.obs;
  final RxMap bookList = {}.obs;
  final RxString book = ''.obs;

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
          "READER",
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
      case "SIGNUP":
        Get.toNamed(Routes.signup);
        break;
      case "GO_BACK":
        pageController.goBack();
        break;
      case "LIST_BOOKS":
        // List books in document
        TextCont.userId.text = message.input;
        break;
      case "OPEN":
        // Open document
        TextCont.userId.text = message.input;
        break;
      case "READ":
        // Read document
        TextCont.userId.text = message.input;
        break;
      case "WAIT":
        // Pause reading
        TextCont.password.text = message.input;
        break;
      case "GOTO_PAGE":
        // Go to page in document
        pageController.goNext();
        break;
    }
  }

  void getBooks() async {
    print("Getting books");
    bookList.value = await dbService.getBooks() ?? {};
  }

  void openBook(String bookName) {
    List url = bookList[bookName].split('/');
    book.value = "https://drive.google.com/uc?export=download&id=${url[5]}";
    PageCont.reader.goNext();
  }
}
