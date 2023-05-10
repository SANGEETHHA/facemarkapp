import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facemarkapp/widgets/custom_drop_down.dart';
import 'controller/manual_update_controller.dart';
import 'models/manual_update_model.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ManualUpdatePage extends StatefulWidget {
 ManualUpdateController controller = Get.put(ManualUpdateController(ManualUpdateModel().obs));
 //const ManualUpdatePage({Key? key}) : super(key: key);

  @override
  _ManualUpdatePageState createState() => _ManualUpdatePageState();
}

class _ManualUpdatePageState extends State<ManualUpdatePage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.maxFinite,
                      decoration: AppDecoration.fillTeal300,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgImage2839x389,
                              height: getVerticalSize(850),
                              width: getHorizontalSize(400),
                              alignment: Alignment.center),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: getPadding(
                                    left: 19, top: 50, right: 18),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                    CustomIconButton(
                                    height: 39,
                                    width: 39,
                                    margin: getMargin(left: 1),
                                    onTap: () {
                                      onTapBtnArrowleft();
                                    },
                                    child: CustomImageView(
                                        svgPath: ImageConstant
                                            .imgArrowleftBlack90001)),
                                Padding(
                                    padding: getPadding(top: 26),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                              "lbl_manual".tr,
                                              style: TextStyle(
                                                  color: ColorConstant.black90001,
                                                  fontSize: getFontSize(30),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: getHorizontalSize(0.28))),
                                          TextSpan(
                                              text: " ",
                                              style: TextStyle(
                                                  color: ColorConstant.indigo900,
                                                  fontSize: getFontSize(30),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: getHorizontalSize(0.28))),
                                          TextSpan(
                                              text: "lbl_update".tr,
                                              style: TextStyle(
                                                  color: ColorConstant.whiteA700,
                                                  fontSize: getFontSize(30),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: getHorizontalSize(0.28)))
                                        ]),
                                        textAlign:
                                        TextAlign.left)),



                                   CustomButton(
                                      height: 56,
                                      text: "lbl_save".tr,
                                      margin: const EdgeInsets.only(top: 23),
                                      onTap: onTapSave)
                                ],
                              ),
                              ))]),
                              ))]),
                              )),
                      ),
                    ),
                  );



  }

  onTapBtnArrowleft() {
    Get.back();
  }

  onTapSave() {
    Get.toNamed(AppRoutes.attendanceGraphPageScreen);
  }



}

