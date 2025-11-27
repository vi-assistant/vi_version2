import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'pages/pages.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Get.find<SignupController>();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text("VI Assistant - Signup", style: Style.bold),
                ],
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.7,
              padding: Style.screenPadding,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: PageCont.signup,
                children: [
                  UsernamePage(),
                  UserIdPage(),
                  DepartmentPage(),
                  PasswordPage(),
                  // ConfirmPasswordPage(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Privacy Policy | Terms and conditions',
                style: Style.grey,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
