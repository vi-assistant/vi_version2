import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vi_assistant/bindings/login.dart';
import 'package:vi_assistant/bindings/reader.dart';
import 'package:vi_assistant/bindings/signup.dart';
import 'package:vi_assistant/bindings/splash.dart';
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
  await dotenv.load(fileName: ".env");
  initServices();
  initControllers();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: ThemeData(colorSchemeSeed: Colors.blue[900]),
      title: "VI-Assistant",
      initialRoute: Routes.splash,
      getPages: [
        GetPage(
          name: Routes.splash,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.login,
          page: () => LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: Routes.signup,
          page: () => SignupView(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: Routes.reader,
          page: () => ReaderView(),
          binding: ReaderBinding(),
        ),
      ],
    ),
  );
}
