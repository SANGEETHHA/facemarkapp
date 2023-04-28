import 'controller/app_navigation_controller.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: getHorizontalSize(375),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: AppDecoration.fillWhiteA700,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                        child: Text("lbl_app_navigation".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtRobotoRegular20))),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(left: 20),
                                        child: Text("msg_check_your_app_s".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: AppStyle.txtRobotoRegular16))),
                                Padding(
                                    padding: getPadding(top: 5),
                                    child: Divider(
                                        height: getVerticalSize(1),
                                        thickness: getVerticalSize(1),
                                        color: ColorConstant.black901))
                              ])),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  decoration: AppDecoration.fillWhiteA700,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              onTapSplashpage();
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "lbl_splash_page".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapSigninpage();
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "lbl_sign_in_page".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapHomepageContainer();
                                            },
                                            child: Container(
                                                decoration: AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "msg_home_page_container".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 5),
                                                          child: Divider(height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: onTapAttendancepage,
                                            child: Container(
                                                decoration: AppDecoration.fillWhiteA700,
                                                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "lbl_attendance_page".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: onTapAttendancegraphpage,
                                            child: Container(
                                                decoration: AppDecoration.fillWhiteA700,
                                                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "msg_attendance_graph2".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapPasswordchangepage();
                                            },
                                            child: Container(
                                                decoration: AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "msg_password_change".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapDashboardpage();
                                            },
                                            child: Container(
                                                decoration: AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "lbl_dashboard_page".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapSendattendancepage();
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 20,
                                                                      top: 10,
                                                                      right: 20,
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                  "msg_send_attendance3".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ]))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapAttendanceupdatepage();
                                            },
                                            child: Container(
                                                decoration:
                                                    AppDecoration.fillWhiteA700,
                                                child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding:
                                                                  getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                              child: Text(
                                                                  "msg_attendance_update2".tr,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyle.txtRobotoRegular20))),
                                                      Padding(
                                                          padding: getPadding(top: 5),
                                                          child: Divider(
                                                              height: getVerticalSize(1),
                                                              thickness: getVerticalSize(1),
                                                              color: ColorConstant.bluegray400))
                                                    ])))
                                      ]))))
                    ]))));
  }

  onTapSplashpage() {
    Get.toNamed(AppRoutes.splashPageScreen);
  }

  onTapSigninpage() {
    Get.toNamed(AppRoutes.signInPageScreen);
  }

  onTapHomepageContainer() {
    Get.toNamed(AppRoutes.homePageContainerScreen);
  }

  onTapAttendancepage() {
    Get.toNamed(AppRoutes.attendancePageScreen);
  }

  onTapAttendancegraphpage() {
    Get.toNamed(AppRoutes.attendanceGraphPageScreen);
  }

  onTapPasswordchangepage() {
    Get.toNamed(AppRoutes.passwordChangePageScreen);
  }

  onTapDashboardpage() {
    Get.toNamed(AppRoutes.dashboardPageScreen);
  }

  onTapSendattendancepage() {
    Get.toNamed(AppRoutes.sendAttendancePageScreen);
  }

  onTapAttendanceupdatepage() {
    Get.toNamed(AppRoutes.attendanceUpdatePageScreen);
  }
}
