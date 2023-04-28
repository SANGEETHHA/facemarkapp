import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/image_preview_page/models/image_preview_model.dart';

class ImagePreviewController extends GetxController {
  ImagePreviewController(this.imagePreviewModelObj);

  Rx<ImagePreviewModel> imagePreviewModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
