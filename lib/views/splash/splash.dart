import 'package:flutter/material.dart';
import 'package:vi_assistant/utils/utils.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 36,
          children: [
            Text("Welcome to VI Assistant", style: Style.heading),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.login),
              child: Text("Login to existing account"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.signup),
              child: Text("Create new account"),
            ),
          ],
        ),
      ),
    );
  }
}
