import 'package:facemarkapp/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_page_controller.dart';
import 'controller/zoom_animation_widget.dart';

class SplashPageScreen extends StatelessWidget {
  final SplashPageController _splashPageController =
  Get.put(SplashPageController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.teal300,
            resizeToAvoidBottomInset : false,
            body: Container(
                height: size.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: getPadding(left: 45, top: 100, right: 45),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ZoomAnimationWidget(
                                  child: CustomImageView(
                                      imagePath: ImageConstant.imgImage1,
                                      height: getVerticalSize(96),
                                      width: getHorizontalSize(92),
                                   //   margin: getMargin(bottom: 22)
                            )
                                ),
                                Padding(
                                    padding: getPadding(top: 59),
                                    child: ZoomAnimationWidget(
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text: "lbl_face".tr,
                                                style: TextStyle(
                                                    color:
                                                    ColorConstant.black90001,
                                                    fontSize: getFontSize(38),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700)),
                                            TextSpan(
                                                text: "lbl_mark".tr,
                                                style: TextStyle(
                                                    color:
                                                    ColorConstant.whiteA700,
                                                    fontSize: getFontSize(38),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700))
                                          ]),
                                          textAlign: TextAlign.center),
                                    )),
                              ])))
                ]))));
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SplashPageController>('_splashPageController', _splashPageController));
  }
}
