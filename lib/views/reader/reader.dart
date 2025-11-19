import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/utils/utils.dart';
import 'pages/pages.dart';

class ReaderView extends GetView<ReaderController> {
  const ReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                spacing: 12,
                children: [
                  Obx(() {
                    if (controller.pageIndex.value != 0) {
                      return IconButton(
                        onPressed: () {
                          PageCont.reader.goBack();
                        },
                        icon: Icon(Icons.arrow_back),
                      );
                    } else {
                      return IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back),
                      );
                    }
                  }),
                  Text("VI Assistant - Reader", style: Style.bold),
                  Spacer(),
                  Obx(() {
                    if (controller.pageIndex.value != 0) {
                      return IconButton(
                        onPressed: () {
                          PageCont.reader.goBack();
                        },
                        icon: Icon(Icons.bookmark),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.8,
            padding: Style.screenPadding,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (page) {
                controller.pageIndex.value = page.toInt();
              },
              children: [DoclistPage(), DocPage()],
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
    );
  }
}
