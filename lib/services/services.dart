import 'package:get/get.dart';

import 'package:vi_assistant/services/llm_service.dart';
import 'package:vi_assistant/services/speech_service.dart';
import 'package:vi_assistant/services/firestore_service.dart';
export 'llm_service.dart';
export 'speech_service.dart';

void initServices() {
  Get.lazyPut(() => LLMService());
  Get.lazyPut(() => SpeechService());
  Get.lazyPut(() => FirestoreService());
}
