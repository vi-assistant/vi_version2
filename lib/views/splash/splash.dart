import 'package:flutter/material.dart';
import 'package:vi_assistant/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 36,
            children: [
              Text(
                "Welcome to VI Assistant",
                style: Style.heading,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
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
      ),
    );
  }
}
