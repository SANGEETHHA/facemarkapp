import 'package:facemarkapp/presentation/manual_update_page/manual_update_page.dart';
import 'package:facemarkapp/presentation/send_attendance_page_screen/send_attendance_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facemarkapp/presentation/dashboard_page_screen/dashboard_item.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/app_bar/custom_app_bar.dart';
import 'package:facemarkapp/widgets/app_bar/appbar_image.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class DashboardPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.teal300,
        body:  Stack(
                children: [
                  Container(
                    margin: getMargin(top: 25),
                    padding: getPadding(left: 18, right: 18),
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
                            svgPath: ImageConstant.imgArrowleftBlack90001,
                          ),
                        ),
                      ],
                    ),
                  ),

      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            height: getVerticalSize(142),
            title: Padding(
              padding: getPadding(left: 23,top: 60,),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "lbl_face".tr,
                      style: TextStyle(
                        color: ColorConstant.black90001,
                        fontSize: getFontSize(32),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: "lbl_mark".tr,
                      style: TextStyle(
                        color: ColorConstant.whiteA700,
                        fontSize: getFontSize(32),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                // textAlign: TextAlign.left,
              ),
            ),
            actions: [
              AppbarImage(
                height: getVerticalSize(96),
                width: getHorizontalSize(92),
                imagePath: ImageConstant.imgImage1,
                margin: getMargin(left: 25, right: 25, bottom: 2,),
              ),
            ],
          ),],),

                 Center(
                   child: Padding(
                    padding:getPadding(top: 150,),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      children: [
                        DashboardItem(
                          title: 'Change Password',
                          icon: Icons.lock,
                          onPressed: () {
                            Get.toNamed(AppRoutes.passwordChangePageScreen);
                          },
                        ),
                        DashboardItem(
                          title: 'Manual Update',
                          icon: Icons.edit,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ManualUpdatePage(),),);},),
                        DashboardItem(
                          title: 'Send Attendance Report',
                          icon: Icons.email,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SendAttendancePageScreen(),),);},),

                        DashboardItem(
                          title: 'Sign Out',
                          icon: Icons.logout,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => onTapSignOut(),
                              ),);
                            },),
                      ],
                    ),
                  ),),],),
    ),);
  }

  onTapSignOut() async {
    try {
      final response = await http.post(Uri.parse('http://facemark.me/dj-rest-auth/logout/'));
      if (response.statusCode == 200)
        {

        Get.offNamed(AppRoutes.signInPageScreen);
      } else {
        // Handle error, show a toast message or an error dialog
      }
    } catch (e) {
      // Handle error, show a toast message or an error dialog
    }
  }

  onTapBtnArrowleft() {
    Get.back();
  }
}
