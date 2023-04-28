import '../controller/attendance_update_page_controller.dart';
import 'package:get/get.dart';

class AttendanceUpdatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceUpdatePageController());
  }
}
