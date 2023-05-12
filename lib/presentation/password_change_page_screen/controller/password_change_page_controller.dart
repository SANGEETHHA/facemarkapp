import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/password_change_page_screen/models/password_change_page_model.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class PasswordChangePageController extends GetxController {

  late TextEditingController newPasswordController;
  late TextEditingController confirmpasswordController;

  var isPasswordVisible = false.obs;


  @override
  void onInit() {
  super.onInit();
  newPasswordController = TextEditingController();
  confirmpasswordController = TextEditingController();
  }

  Rx<PasswordChangePageModel> passwordChangePageModelObj =
      PasswordChangePageModel().obs;

  Rx<bool> isShowPassword = false.obs;


  @override
  void onClose() {
  newPasswordController.dispose();
  confirmpasswordController.dispose();
  super.onClose();
  }

  // rest of the controller code...
  }
