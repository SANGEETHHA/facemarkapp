import '../controller/password_change_page_controller.dart';
import 'package:get/get.dart';

class PasswordChangePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordChangePageController());
  }
}
