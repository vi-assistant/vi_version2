import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class DoclistPage extends GetView<ReaderController> {
  const DoclistPage({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getBooks();
    return Obx(() {
      if (controller.bookList.isEmpty) {
        return Center(
          child: SizedBox(
            width: 45,
            height: 45,
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        List bookNames = controller.bookList.keys.toList();
        return ListView.separated(
          itemCount: bookNames.length,
          itemBuilder: (context, index) {
            return ListItem(
              title: bookNames[index],
              preview: "Last read - 06:05am",
              onTap: () => controller.openBook(bookNames[index]),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 16),
        );
      }
    });
  }
}
