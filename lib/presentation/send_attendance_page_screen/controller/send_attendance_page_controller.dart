import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/send_attendance_page_screen/models/send_attendance_page_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';

class SendAttendancePageController extends GetxController {
  Rx<SendAttendancePageModel> sendAttendancePageModelObj =
      SendAttendancePageModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    sendAttendancePageModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    sendAttendancePageModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    sendAttendancePageModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    sendAttendancePageModelObj.value.dropdownItemList1.refresh();
  }
}
