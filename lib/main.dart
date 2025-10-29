import 'package:flutter/material.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:vi_assistant/views/views.dart';

// Vertex AI for Gemini suff

void main() {
  initControllers();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue[900]),
      title: "VI-Assistant",
      initialRoute: '/splash',
      routes: {
        Routes.home: (context) => Text("Doc List"),
        Routes.splash: (context) => SplashScreen(),
        Routes.login: (context) => LoginView(),
        Routes.signup: (context) => Text("Signup page"),
        Routes.reader: (context) => Text("Reader page"),
      },
    ),
  );
}
