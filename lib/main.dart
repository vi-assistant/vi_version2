import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:vi_assistant/views/views.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initServices();
  initControllers();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue[900]),
      title: "VI-Assistant",
      initialRoute: '/splash',
      routes: {
        Routes.splash: (context) => SplashScreen(),
        Routes.login: (context) => LoginView(),
        Routes.signup: (context) => SignupView(),
        Routes.reader: (context) => ReaderView(),
      },
    ),
  );
}
