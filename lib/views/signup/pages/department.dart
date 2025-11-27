import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});
  @override
  Widget build(BuildContext context) {
    final app = Get.find<AppController>();
    final c = Get.find<SignupController>();
    return Center(
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Spacer(),
            Obx(() {
              return Center(child: Text(app.error.value, style: Style.error));
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
                  onPressed: PageCont.signup.goBack,
                  child: Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: c.checkDepartment,
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
