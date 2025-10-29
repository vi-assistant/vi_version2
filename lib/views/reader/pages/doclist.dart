import 'package:flutter/material.dart';
import 'package:vi_assistant/widgets/widgets.dart';

class DoclistPage extends StatelessWidget {
  const DoclistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListItem(
          title: "Text $index",
          preview: "This is the preview of the text",
          onTap: () {},
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
    );
  }
}
