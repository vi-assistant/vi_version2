import 'package:get/get.dart';
import 'package:vi_assistant/controllers/utils/page_cont.dart';
import 'package:vi_assistant/services/services.dart';

class LoginController extends GetxController {
  final speechService = Get.find<SpeechService>();
  final pageController = PageCont.login;
  final RxString dta = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await speechService.initStt();
    speechService.listen();
    speechService.streamData.listen((data) {
      print(data);
      dta.value = data;
    });
  }
}
