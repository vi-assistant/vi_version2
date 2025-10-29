import 'package:flutter/material.dart';
import 'package:vi_assistant/utils/style.dart';

class TextEntry extends StatelessWidget {
  const TextEntry({
    super.key,
    required this.label,
    this.hint = '',
    this.hide = false,
  });

  final String label, hint;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(label, style: Style.label),
        TextField(obscureText: hide, decoration: Style.roundedRectangle(hint)),
      ],
    );
  }
}
