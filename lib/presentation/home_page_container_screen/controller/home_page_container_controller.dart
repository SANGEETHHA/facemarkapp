import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/home_page_container_screen/models/home_page_container_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';

class HomePageContainerController extends GetxController {
  Rx<HomePageContainerModel> homePageContainerModelObj =
      HomePageContainerModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {}
}
