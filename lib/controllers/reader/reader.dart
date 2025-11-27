import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/models/models.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:vi_assistant/utils/utils.dart';

class ReaderController extends GetxController {
  final dbService = Get.find<FirestoreService>();
  final app = Get.find<AppController>();
  final pageController = PageCont.reader;
  final RxInt pageIndex = 0.obs;
  final RxBool isListening = false.obs;
  final RxString lastWords = ''.obs;
  final RxMap bookList = {}.obs;
  final RxString book = ''.obs;

  void action(BotMessage message) {
    switch (message.action) {
      case "SIGNUP":
        app.screen.value = Routes.signup;
        Get.toNamed(Routes.signup);
        break;
      case "GO_BACK":
        pageController.goBack();
        break;
      case "LIST_BOOKS":
        // List books in document
        break;
      case "OPEN":
        // Open document
        break;
      case "READ":
        // Read document
        break;
      case "WAIT":
        // Pause reading
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
