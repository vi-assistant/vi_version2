import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/login/login.dart';
import 'package:vi_assistant/controllers/utils/utils.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class UserIdPage extends GetView<LoginController> {
  const UserIdPage({super.key});

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
            TextEntry(label: "Enter Username", hint: "John"),
            ElevatedButton(
              onPressed: PageCont.login.goNext,
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
