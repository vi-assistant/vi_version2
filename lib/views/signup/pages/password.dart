import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Get.find<AppController>();
    final c = Get.find<SignupController>();
    return Center(
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Obx(() {
              return Center(child: Text(app.error.value, style: Style.error));
            }),
            TextEntry(
              label: "Enter Password",
              hint: "Not less than 6 characters",
              hide: true,
              controller: TextCont.password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: PageCont.login.goBack,
                  child: Text('Prev'),
                ),
                ElevatedButton(onPressed: c.signup, child: Text('Submit')),
              ],
            ),
            Spacer(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
