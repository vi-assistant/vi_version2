export 'box_service.dart';
export 'llm_service.dart';
export 'speech_service.dart';
export 'firestore_service.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/services/box_service.dart';
import 'package:vi_assistant/services/llm_service.dart';
import 'package:vi_assistant/services/speech_service.dart';
import 'package:vi_assistant/services/firestore_service.dart';

void initServices() {
  Get.put(BoxService());
  Get.put(LLMService());
  Get.put(SpeechService());
  Get.put(FirestoreService());
}
