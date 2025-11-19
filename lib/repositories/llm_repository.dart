import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:vi_assistant/models/message.dart';
import 'package:vi_assistant/prompts/auth.dart';
import 'package:vi_assistant/services/llm_service.dart';
import 'package:vi_assistant/services/speech_service.dart';

class LLMRepository {
  final List<Message> messages = [];
  final speechService = Get.find<SpeechService>();
  final llmService = Get.find<LLMService>();

  Future<BotMessage> respond(
    String message,
    String screen,
    List<String> actions,
  ) async {
    messages.clear();
    messages.insert(0, UserMessage(text: message));
    try {
      final message = await llmService.getResponse(
        getGeminiPrompt(screen, actions),
      );
      return message;
    } catch (e) {
      Get.log(e.toString()); // Speak out the error
      messages.removeLast();
      await speechService.speak(e.toString());
    }
    return BotMessage();
  }

  void shutUp() {
    // messages.clear();
  }

  String getGeminiPrompt(
    String screen,
    List<String> actions, {
    Uint8List? pdf,
  }) => json.encode({
    "contents": [...messages.reversed.map((e) => e.toJson())],
    "systemInstruction": {
      "role": "user",
      "parts": [
        pdf != null
            ? {
                "inline_data": {
                  "mime_type": "application/pdf",
                  "data": base64Encode(pdf),
                },
              }
            : null,
        {"text": prompt(screen, actions)},
      ],
    },
    "generationConfig": {
      "temperature": 0,
      "topK": 64,
      "topP": 0.95,
      "maxOutputTokens": 8192,
      "responseMimeType": "application/json",
      "responseSchema": {
        "type": "object",
        "properties": {
          "action": {"type": "string"},
          "input": {"type": "string"},
          "message": {"type": "string"},
        },
      },
    },
  });
}
