import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/splash_page_screen/models/splash_page_model.dart';

class SplashPageController extends GetxController {
  Rx<SplashPageModel> splashPageModelObj = SplashPageModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.signInPageScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
