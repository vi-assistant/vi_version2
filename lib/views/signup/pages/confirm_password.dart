import 'package:flutter/material.dart';
import 'package:vi_assistant/controllers/utils/utils.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class ConfirmPasswordPage extends StatelessWidget {
  const ConfirmPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 460,
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            TextEntry(
              label: "Confirm Password",
              hint: "Not less than 6 characters",
              hide: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: PageCont.login.goBack,
                  child: Text('Prev'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Submit')),
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
