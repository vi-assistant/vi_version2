import 'dart:async';
import 'package:flutter/foundation.dart';
import 'llm_service.dart';
import 'package:get/get.dart';
import '../models/speech_data.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService extends GetxService {
  FlutterTts tts = FlutterTts();
  SpeechToText stt = SpeechToText();
  final llmService = LLMService();
  bool isAvailable = false;
  final isListening = false.obs;
  final _streamcontroller = StreamController<SpeechData>.broadcast();
  Stream<SpeechData> get streamData => _streamcontroller.stream;

  @override
  void onInit() async {
    await tts.awaitSpeakCompletion(true);
    isAvailable = await stt.initialize(
      onStatus: (status) {
        if (status == "notListening") {
          Future.delayed(Duration(milliseconds: 300), () => startListening());
        }
      },
      onError: (errorNotification) {
        Future.delayed(Duration(milliseconds: 300), () => startListening());
      },
    );
    startListening();
    super.onInit();
  }

  @override
  void onClose() {
    _streamcontroller.close();
    super.onClose();
  }

  Future<void> speak(String text) async {
    if (isListening.value) {
      await stt.stop();
      isListening.value = false;
    }
    if (text.isNotEmpty && text != "null") {
      debugPrint("[BOT] $text");
      await tts.speak(text);
    }
  }

  void startListening() async {
    if (isAvailable) {
      // await stt.stop();
      try {
        await stt.listen(
          listenOptions: SpeechListenOptions(
            listenMode: ListenMode.dictation,
            onDevice: true,
          ),
          onResult: (result) {
            _streamcontroller.sink.add(
              SpeechData(
                liveResponse: result.recognizedWords,
                entireResponse: "",
                isListening: !result.finalResult,
              ),
            );
          },
        );
      } catch (e) {
        debugPrint("[ERROR] $e");
      }
    }
  }
}
