import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/sign_in_page_screen/models/sign_in_page_model.dart';
import 'package:flutter/material.dart';

class SignInPageController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignInPageModel> signInPageModelObj = SignInPageModel().obs;

  var isPasswordVisible = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
