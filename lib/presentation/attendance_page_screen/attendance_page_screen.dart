import 'dart:ui';
import 'controller/attendance_page_controller.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/home_page/home_page.dart';
import 'package:facemarkapp/presentation/manual_update_page/manual_update_page.dart';
import 'package:facemarkapp/presentation/image_preview_page/image_preview_page.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:facemarkapp/presentation/api.dart';


class AttendancePageScreen extends StatefulWidget {

 const AttendancePageScreen({
     required List<String> usns,
  });

  @override
  _AttendancePageScreenState createState() => _AttendancePageScreenState();
}

class _AttendancePageScreenState extends State<AttendancePageScreen> {
  // List<dynamic> branches = [];
  // List<dynamic> subjects = [];
  // List<dynamic> sections = [];
   late List<dynamic> usns;

  final AttendancePageController _attendancePageController = AttendancePageController();

  @override
  void initState() {
    super.initState();
    usns = [];
    // getBranches().then((value) {
    //   setState(() {
    //     branches = value;
    //   });
    // });
    // getSubjects().then((value) {
    //   setState(() {
    //     subjects = value;
    //   });
    // });
    // getSections().then((value) {
    //   setState(() {
    //     sections = value;
    //   });
    // });

  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: ColorConstant.teal300,
            body:SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
            constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
            child:Container(
                width: size.width,
                height: size.height,
                padding: getPadding(bottom: 92),
                decoration: BoxDecoration(
                    color: ColorConstant.teal300,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgImage2),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 15, top: 2, right: 15, bottom: 2),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                              height: 39,
                              width: 39,
                              margin: getMargin(left: 5, top: 48),
                              onTap: () {
                                onTapBtnArrowleft();},
                              child: CustomImageView(
                                  svgPath:
                                      ImageConstant.imgArrowleftBlack90001)),
                          Padding(
                              padding: getPadding(left: 4, top: 8),
                              child: Text("lbl_attendance".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold30)),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' Students Present:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Wrap(
                                  spacing: 10,
                                  children: [
                                    for (var usn in usns)
                                      Chip(
                                        label: Text(usn),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtButtonprimary();},
                                  child: Container(

                                      width: getHorizontalSize(129),
                                      margin: getMargin(top: 26),
                                      padding: getPadding(left: 12, top: 12, right: 12, bottom: 12),
                                      decoration: AppDecoration.txtFillBlack900cc.copyWith(
                                              borderRadius: BorderRadiusStyle.txtRoundedBorder10),
                                      child: Text("lbl_save".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: AppStyle.txtPoppinsBold14)))),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  margin: getMargin(top: 14),
                                  padding: getPadding(left: 2, top: 2, right: 2, bottom: 2),
                                  decoration: AppDecoration.fillTeal300ce
                                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("msg_add_more_students".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtPoppinsBold32WhiteA700),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(getVerticalSize(56), getHorizontalSize(50)),
                                       // padding: getPadding(left: 50,right: 50),
                                        primary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),),),
                                      onPressed: () async {
                                        // Request camera permission
                                        if (await Permission.camera.request().isGranted) {
                                          // Navigate to camera screen
                                          final image = await ImagePicker().pickImage(source: ImageSource.camera);
                                          // Add code to process the captured image
                                        } else {
                                          // Display error message if camera permission is not granted
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Camera permission is required'),
                                              duration: Duration(seconds: 3),),);}},
                                      child: Text(
                                        "lbl_camera".tr,
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,),),),
                                    width: getVerticalSize(400),),

                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ManualUpdatePage(),),);},
                                    child: CustomButton(
                                      height: getVerticalSize(56),
                                      text: "lbl_manually".tr,
                                      margin: getMargin(top: 5, bottom: 5),
                                      fontStyle: ButtonFontStyle.InterSemiBold20,
                                    ),)])))
                        ]))),)))));
  }

  onTapBtnArrowleft() {
    Get.offAll(Homepage());
  }

  onTapTxtButtonprimary() {
    Get.toNamed(AppRoutes.attendanceGraphPageScreen);
  }
}
