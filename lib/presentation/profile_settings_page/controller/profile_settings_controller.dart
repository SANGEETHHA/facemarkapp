import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/profile_settings_page/models/profile_settings_model.dart';

class ProfileSettingsController extends GetxController {
  ProfileSettingsController(this.profileSettingsModelObj);

  Rx<ProfileSettingsModel> profileSettingsModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
