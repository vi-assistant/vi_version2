import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class UserIdPage extends GetView<SignupController> {
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
            TextEntry(
              label: "Enter User ID",
              hint: "M12***04",
              controller: TextCont.userId,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: PageCont.signup.goBack,
                  child: Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: PageCont.signup.goNext,
                  child: Text('Next'),
                ),
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
