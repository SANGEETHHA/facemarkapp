import '../controller/attendance_graph_page_controller.dart';
import 'package:get/get.dart';

class AttendanceGraphPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceGraphPageController());
  }
}
