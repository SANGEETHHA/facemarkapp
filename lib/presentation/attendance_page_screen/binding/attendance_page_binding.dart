import '../controller/attendance_page_controller.dart';
import 'package:get/get.dart';

class AttendancePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendancePageController());
  }
}
