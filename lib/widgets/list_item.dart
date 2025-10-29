import 'package:flutter/material.dart';
import 'package:vi_assistant/utils/utils.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.preview,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String title;
  final String preview;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Style.tilePadding,
        decoration: Style.listTile,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Style.bold),
                  Text(preview),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, semanticLabel: "More"),
            ),
          ],
        ),
      ),
    );
  }
}
