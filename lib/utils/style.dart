import 'package:flutter/material.dart';

class Style {
  static final TextStyle heading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  static final TextStyle label = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static final TextStyle bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static final TextStyle error = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.red,
    fontSize: 17,
  );

  static final TextStyle grey = TextStyle(
    color: Colors.grey[700],
    fontSize: 14,
  );

  static final TextStyle greyBold = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey[700],
    fontSize: 14,
  );

  static final BoxDecoration screenCard = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  static final BoxDecoration listTile = BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(12),
  );

  static InputDecoration roundedRectangle(String hint) => InputDecoration(
    hintText: hint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade700, width: 2),
      gapPadding: 12,
    ),
  );

  static final EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 24,
  );

  static final EdgeInsets cardPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static final EdgeInsets tilePadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 24,
  );
}
