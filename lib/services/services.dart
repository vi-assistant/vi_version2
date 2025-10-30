import 'package:get/get.dart';
import 'package:vi_assistant/services/speech.dart';
export 'speech.dart';

void initServices() {
  Get.put(SpeechService());
}
