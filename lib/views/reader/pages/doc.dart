import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DocPage extends StatelessWidget {
  const DocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      'http://ebooks.syncfusion.com/downloads/flutter-succinctly/flutter-succinctly.pdf',
      onDocumentLoadFailed: (details) => debugPrint("Didn't load"),
    );
  }
}
