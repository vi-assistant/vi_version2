import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService extends GetxService {
  SpeechService() {
    speech = SpeechToText();
  }

  late SpeechToText speech;
  bool isAvailable = false;
  final _streamcontroller = StreamController<String>.broadcast();
  Stream<String> get streamData => _streamcontroller.stream;

  @override
  void onClose() {
    _streamcontroller.close();
    speech.stop();
    super.onClose();
  }

  Future<bool> initStt() async {
    isAvailable = await speech.initialize(
      onStatus: (status) => status == 'notListening' ? listen() : null,
      onError: (error) => listen(),
    );
    if (!isAvailable) {
      debugPrint('Permission not granted');
    }
    return isAvailable;
  }

  void listen() {
    if (isAvailable) {
      speech.listen(
        onResult: (value) {
          _streamcontroller.sink.add(value.recognizedWords);
        },
      );
    }
  }
}
