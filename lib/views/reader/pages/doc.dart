import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:vi_assistant/controllers/controllers.dart';

class DocPage extends GetView<ReaderController> {
  const DocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SfPdfViewer.network(
      controller.book.value,
      onDocumentLoadFailed: (details) => print(details.description),
    );
    // return Container();
  }
}
