import '../controller/send_attendance_page_controller.dart';
import 'package:get/get.dart';

class SendAttendancePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendAttendancePageController());
  }
}
