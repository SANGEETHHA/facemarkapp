import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/attendance_page_screen/models/attendance_page_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';

class AttendancePageController extends GetxController {
  Rx<AttendancePageModel> attendancePageModelObj = AttendancePageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
