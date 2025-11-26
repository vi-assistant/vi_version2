import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class UsernamePage extends GetView<SignupController> {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            TextEntry(
              label: "Enter Username",
              hint: "John Doe",
              controller: TextCont.username,
            ),
            ElevatedButton(
              onPressed: PageCont.signup.goNext,
              child: Text('Next'),
            ),
            Spacer(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
