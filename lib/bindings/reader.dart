import 'package:get/get.dart';
import 'package:vi_assistant/controllers/controllers.dart';

class ReaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReaderController>(() => ReaderController());
  }
}
