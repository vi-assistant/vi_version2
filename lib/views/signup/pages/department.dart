import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/auth/signup.dart';
import 'package:vi_assistant/controllers/utils/text_cont.dart';
import 'package:vi_assistant/controllers/utils/utils.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class DepartmentPage extends GetView<SignupController> {
  const DepartmentPage({super.key});

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
            Obx(() {
              return Center(
                child: Text(controller.errorMessage.value, style: Style.error),
              );
            }),
            TextEntry(
              label: "Enter Department",
              hint: "",
              controller: TextCont.department,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: PageCont.login.goBack,
                  child: Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: controller.checkDepartment,
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
