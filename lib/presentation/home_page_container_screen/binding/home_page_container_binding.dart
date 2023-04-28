import '../controller/home_page_container_controller.dart';
import 'package:get/get.dart';

class HomePageContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageContainerController());
  }
}
