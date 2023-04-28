import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/dashboard_page_screen/models/dashboard_page_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';

class DashboardPageController extends GetxController {
  Rx<DashboardPageModel> dashboardPageModelObj = DashboardPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
