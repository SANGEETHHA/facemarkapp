import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/attendance_graph_page_screen/models/attendance_graph_page_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';

class AttendanceGraphPageController extends GetxController {
  Rx<AttendanceGraphPageModel> attendanceGraphPageModelObj =
      AttendanceGraphPageModel().obs;

  RxString radioGroup = "".obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
