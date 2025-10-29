import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService extends GetxService {
  SpeechService() {
    speech = SpeechToText();
  }

  late SpeechToText speech;

  Future<SpeechService> init() async {
    await initStt();
    return this;
  }

  Future initStt() async {
    bool available = await speech.initialize(
      onStatus: (status) => debugPrint(status),
      onError: (error) => debugPrint(error.errorMsg),
    );
    if (available) {
      speech.listen(
        onResult: (result) {
          debugPrint(result.recognizedWords);
        },
      );
    } else {
      debugPrint("The user has denied the use of speech recognition.");
    }
  }
}
