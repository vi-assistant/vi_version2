import 'package:flutter/material.dart';
import 'package:vi_assistant/controllers/utils/page_cont.dart';
import 'package:vi_assistant/utils/utils.dart';

import 'pages/pages.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text("VI Assistant - Login", style: Style.bold),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.7,
              height: size.height * 0.7,
              decoration: Style.screenCard,
              padding: Style.screenPadding,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: PageCont.login,
                children: [UserIdPage(), PasswordPage()],
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
