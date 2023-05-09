import 'package:facemarkapp/presentation/attendance_page_screen/attendance_page_screen.dart';
import 'package:facemarkapp/presentation/dashboard_page_screen/dashboard_page_screen.dart';
import 'controller/password_change_page_controller.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/core/utils/validation_functions.dart';
import 'package:facemarkapp/presentation/home_page/home_page.dart';
import 'package:facemarkapp/presentation/image_preview_page/image_preview_page.dart';
import 'package:facemarkapp/presentation/manual_update_page/manual_update_page.dart';
import 'package:facemarkapp/presentation/profile_settings_page/profile_settings_page.dart';
import 'package:facemarkapp/widgets/custom_bottom_bar.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:facemarkapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class PasswordChangePageScreen extends GetWidget<PasswordChangePageController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.teal300,
            body: Form(
                key: _formKey,
                child: Container(
                    height: size.height,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage2,
                          height: getVerticalSize(850),
                          width: getHorizontalSize(400),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(top: 5),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: getMargin(top: 45),
                                        padding:
                                        getPadding(left: 18, right: 18),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CustomIconButton(
                                                  height: 39,
                                                  width: 39,
                                                  margin: getMargin(left: 2),
                                                  onTap: () {
                                                    onTapBtnArrowleft();
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant.imgArrowleftBlack90001)),
                                              Padding(
                                                  padding: getPadding(left: 1, top: 48),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: "lbl_profile".tr,
                                                            style: TextStyle(
                                                                color: ColorConstant.black90001,
                                                                fontSize: getFontSize(30),
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w700)),
                                                        TextSpan(
                                                            text: "lbl_settings".tr,
                                                            style: TextStyle(
                                                                color: ColorConstant.whiteA700,
                                                                fontSize:
                                                                getFontSize(30),
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w700))
                                                      ]),
                                                      textAlign: TextAlign.left)),
                                              Padding(
                                                  padding: getPadding(left: 1, top: 23),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text: "lbl_current".tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.black90001,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400)),
                                                                  TextSpan(
                                                                      text: "lbl_password2"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.whiteA700,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400))
                                                                ]),
                                                            textAlign: TextAlign.left),
                                                        Obx(() =>
                                                            CustomTextFormField(
                                                                focusNode: FocusNode(),
                                                                controller: controller.currentPasswordController,
                                                                hintText: "lbl_current_password".tr,
                                                                margin: getMargin(top: 5),
                                                                textInputAction: TextInputAction.done,
                                                                textInputType: TextInputType.visiblePassword,
                                                                suffix: InkWell(
                                                                  onTap: () {
                                                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                                                  },
                                                                  child: Container(
                                                                    margin: getMargin(left: 30, top: 21, right: 18, bottom: 22),
                                                                    child: Icon(
                                                                      controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                                                                      color: ColorConstant.gray500,
                                                                    ),
                                                                  ),
                                                                ),
                                                                suffixConstraints:
                                                                BoxConstraints(maxHeight: getVerticalSize(56)),
                                                                validator: (value) {
                                                                  if (value == null || (!isValidPassword(value, isRequired: true))) {
                                                                    return "Please enter valid password";
                                                                  }
                                                                  return null;
                                                                },
                                                                isObscureText: !controller.isPasswordVisible.value
                                                            ))
                                                      ])),

                                              Padding(
                                                  padding: getPadding(left: 1, top: 23),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text: "lbl_new".tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.black90001,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400)),
                                                                  TextSpan(
                                                                      text: "lbl_password2"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.whiteA700,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400))
                                                                ]),
                                                            textAlign: TextAlign.left),
                                                        Obx(() =>
                                                            CustomTextFormField(
                                                                focusNode: FocusNode(),
                                                                controller: controller.newPasswordController,
                                                                hintText: "lbl_new_password".tr,
                                                                margin: getMargin(top: 5),
                                                                textInputAction: TextInputAction.done,
                                                                textInputType: TextInputType.visiblePassword,
                                                                suffix: InkWell(
                                                                  onTap: () {
                                                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                                                  },
                                                                  child: Container(
                                                                    margin: getMargin(left: 30, top: 21, right: 18, bottom: 22),
                                                                    child: Icon(
                                                                      controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                                                                      color: ColorConstant.gray500,
                                                                    ),
                                                                  ),
                                                                ),
                                                                suffixConstraints:
                                                                BoxConstraints(maxHeight: getVerticalSize(56)),
                                                                validator: (value) {
                                                                  if (value == null || (!isValidPassword(value, isRequired: true))) {
                                                                    return "Please enter valid password";
                                                                  }
                                                                  return null;
                                                                },
                                                                isObscureText: !controller.isPasswordVisible.value
                                                            ))
                                                      ])),

                                              Padding(
                                                  padding: getPadding(left: 1, top: 23),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text: "lbl_confirm".tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.black90001,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400)),
                                                                  TextSpan(
                                                                      text: "lbl_password2"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color: ColorConstant.whiteA700,
                                                                          fontSize: getFontSize(14),
                                                                          fontFamily: 'Inter',
                                                                          fontWeight: FontWeight.w400))
                                                                ]),
                                                            textAlign: TextAlign.left),
                                                        Obx(() =>
                                                            CustomTextFormField(
                                                                focusNode: FocusNode(),
                                                                controller: controller.confirmpasswordController,
                                                                hintText: "lbl_repeat_password".tr,
                                                                margin: getMargin(top: 5),
                                                                textInputAction: TextInputAction.done,
                                                                textInputType: TextInputType.visiblePassword,
                                                                suffix: InkWell(
                                                                  onTap: () {
                                                                    controller.isPasswordVisible.value = !controller.isPasswordVisible.value;
                                                                  },
                                                                  child: Container(
                                                                    margin: getMargin(left: 30, top: 21, right: 18, bottom: 22),
                                                                    child: Icon(
                                                                      controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                                                                      color: ColorConstant.gray500,
                                                                    ),
                                                                  ),
                                                                ),
                                                                suffixConstraints:
                                                                BoxConstraints(maxHeight: getVerticalSize(56)),
                                                                validator: (value) {
                                                                  if (value == null || (!isValidPassword(value, isRequired: true))) {
                                                                    return "Please enter valid password";
                                                                  }
                                                                  return null;
                                                                },
                                                              isObscureText: !controller.isPasswordVisible.value
                                                                     ))
                                                      ])),
                                              CustomButton(
                                                height: getVerticalSize(56),
                                                text: "lbl_save".tr,
                                                margin: getMargin(left: 1, top: 49),
                                                onTap: onTapSave,
                                              ),
                                            ])),
                                    Spacer()
                                  ])))
                    ]))),
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Volume:
        return AppRoutes.homePage;
      case BottomBarEnum.History:
        return AppRoutes.imagePreviewPage;
      case BottomBarEnum.Grid:
        return AppRoutes.dashboardPageScreen;
      case BottomBarEnum.Computer:
        return AppRoutes.profileSettingsPage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return Homepage();
      case AppRoutes.imagePreviewPage:
        var _image;
        return ImagePreviewPage(image: _image);
      case AppRoutes.dashboardPageScreen:
        return DashboardPageScreen();
      case AppRoutes.profileSettingsPage:
        return ProfileSettingsPage();
      default:
        return DefaultWidget();
    }
  }
  onTapSave() {
    Get.toNamed(AppRoutes.profileSettingsPage);
  }

  onTapBtnArrowleft() {
    Get.back();
  }
}
