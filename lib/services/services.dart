import 'package:get/get.dart';
import 'package:vi_assistant/services/llm_service.dart';
import 'package:vi_assistant/services/speech_service.dart';

export 'auth_service.dart';
export 'llm_service.dart';
export 'speech_service.dart';

void initServices() async {
  await Get.putAsync(() => SpeechService().init());
  await Get.putAsync(() => LLMService().init());
}
