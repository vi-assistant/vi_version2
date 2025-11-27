import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vi_assistant/models/models.dart';

class BoxService extends GetxService {
  late GetStorage box;
  @override
  void onInit() async {
    await GetStorage.init();
    box = GetStorage();
    super.onInit();
  }

  bool saveUser(User user) {
    try {
      box.write('user', user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  User getUser() {
    return User.fromJson(box.read('user'));
  }

  Map getLastRead() => box.read('lastRead');
  bool setLastRead(String doc, int page) {
    try {
      box.write('lastRead', {'doc': doc, 'page': page});
      return true;
    } catch (e) {
      return false;
    }
  }
}
