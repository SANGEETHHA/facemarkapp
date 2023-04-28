import 'controller/profile_settings_controller.dart';
import 'models/profile_settings_model.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class ProfileSettingsPage extends StatelessWidget {
  ProfileSettingsController controller =
  Get.put(ProfileSettingsController(ProfileSettingsModel().obs));


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.teal300,
        body:
        SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minWidth: MediaQuery.of(context).size.width,
    minHeight: MediaQuery.of(context).size.height,
    ),
    child: IntrinsicHeight(
        child: Container(
          height: getVerticalSize(752),
          width: double.maxFinite,
          decoration: AppDecoration.fillTeal300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage2,
                height: getVerticalSize(850),
                width: getHorizontalSize(400),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Container(
                        margin: getMargin(top: 45),
                        padding: getPadding(left: 17, right: 17),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomIconButton(
                              height: 39,
                              width: 39,
                              margin: getMargin(left: 3),
                              onTap: () {
                                onTapBtnArrowleft();
                              },
                              child: CustomImageView(
                                svgPath:
                                ImageConstant.imgArrowleftBlack90001,
                              ),
                            ),

                            Padding(
                              padding: getPadding(left: 2, top: 48),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "lbl_profile".tr,
                                      style: TextStyle(
                                        color: ColorConstant.black90001,
                                        fontSize: getFontSize(30),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "lbl_settings".tr,
                                      style: TextStyle(
                                        color: ColorConstant.whiteA700,
                                        fontSize: getFontSize(30),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),

                            CustomButton(
                              height: getVerticalSize(56),
                              text: "lbl_change_password".tr,
                              margin: getMargin(left: 3, top: 56),
                              onTap: onTapChangepassword,
                            ),
                            CustomButton(
                              height: getVerticalSize(56),
                              text: "lbl_sign_out".tr,
                              margin: getMargin(left: 3, top: 56),
                              onTap: onTapSignout,
                            )
                          ],
                        ),
                      ),),],),),],),),),))));
      }

      onTapBtnArrowleft() {
        Get.back();
      }

      onTapChangepassword() {
        Get.toNamed(AppRoutes.passwordChangePageScreen);
      }

      onTapSignout() {
        Get.toNamed(AppRoutes.splashPageScreen);
      }
    }
