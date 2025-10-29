import 'package:flutter/material.dart';

class DoclistPage extends StatelessWidget {
  const DoclistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(title: Text("Text $index")),
      separatorBuilder: (context, index) => SizedBox(height: 12),
    );
  }
}
