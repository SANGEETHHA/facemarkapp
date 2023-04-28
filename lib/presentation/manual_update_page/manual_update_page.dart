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

  String? _selectedBranch;
  String? _selectedSection;
  String _selectedSubject ="";

  final TextEditingController _usnController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  Future<void> _submitAttendance() async {
  final usn = _usnController.text;
  final date = _dateController.text;
  final status = _statusController.text;

  final response = await http.put(
  Uri.parse('url/api/attendance/$usn/$date'),
  headers: <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String, String>{
  'status': status,
  }),
  );

  if (response.statusCode == 200) {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Attendance updated successfully')),
  );
  } else {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Failed to update attendance')),
  );
  }
  }


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
                                                  color: ColorConstant
                                                      .black90001,
                                                  fontSize:
                                                  getFontSize(
                                                      30),
                                                  fontFamily:
                                                  'Poppins',
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  letterSpacing:
                                                  getHorizontalSize(
                                                      0.28))),
                                          TextSpan(
                                              text: " ",
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .indigo900,
                                                  fontSize:
                                                  getFontSize(
                                                      30),
                                                  fontFamily:
                                                  'Poppins',
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  letterSpacing:
                                                  getHorizontalSize(
                                                      0.28))),
                                          TextSpan(
                                              text:
                                              "lbl_update".tr,
                                              style: TextStyle(
                                                  color: ColorConstant
                                                      .whiteA700,
                                                  fontSize:
                                                  getFontSize(
                                                      30),
                                                  fontFamily:
                                                  'Poppins',
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  letterSpacing:
                                                  getHorizontalSize(
                                                      0.28)))
                                        ]),
                                        textAlign:
                                        TextAlign.left)),


                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            margin: getMargin(left: 5, right:5,),
                                            child: Padding(
                                              padding: getPadding(right: 1.5, left: 1.5), // Add padding of 16 pixels on all sides
                                              child:Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Select',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                                letterSpacing: getHorizontalSize(0.5),
                                                              ),),
                                                            TextSpan(
                                                              text: ' Branch',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                                letterSpacing: getHorizontalSize(0.5),
                                                              ),),],),),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 1, bottom: 1),
                                                        child: DropdownButton<String>(
                                                          hint: Text('Aeronautical Engineering'.tr),
                                                          value: _selectedBranch,
                                                          onChanged: (String? value) {
                                                            setState(() {
                                                              _selectedBranch = value;
                                                            });},
                                                          items: <String>[
                                                            'Aeronautical Engineering',
                                                            'Tool Engineering',
                                                          ].map<DropdownMenuItem<String>>((String value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                style: TextStyle(
                                                                  color: Colors.black54, // set the color of the dropdown items to black
                                                                ),),);
                                                          }).toList(),
                                                          focusNode: FocusNode(),
                                                          icon: Icon(Icons.arrow_drop_down),
                                                          iconEnabledColor: Colors.black,
                                                          iconDisabledColor: Colors.grey,
                                                          iconSize: 26,
                                                          style: AppStyle.txtPoppinsBold14
                                                              .copyWith(letterSpacing: getHorizontalSize(0.5),),
                                                          underline: Container(height: 2, color: Colors.black),
                                                        ),),],),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'Select',
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                                letterSpacing: getHorizontalSize(0.5),
                                                              ),),
                                                            TextSpan(
                                                              text: ' Section',
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 14,
                                                                letterSpacing: getHorizontalSize(0.5),
                                                              ),),],),),

                                                      Padding(
                                                        padding: EdgeInsets.only(top: 1, bottom: 1),
                                                        child: DropdownButton<String>(
                                                          hint: Text('A'.tr),
                                                          value: _selectedSection,
                                                          onChanged: (String? value) {
                                                            setState(() {
                                                              _selectedSection = value;
                                                            });
                                                          },
                                                          items: <String>['A', 'B', 'C', 'D']
                                                              .map<DropdownMenuItem<String>>((String value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value,
                                                              child: Text(
                                                                value,
                                                                style: TextStyle(
                                                                  color: Colors.black54, // set the color of the dropdown items to black
                                                                ),),);}).toList(),
                                                          focusNode: FocusNode(),
                                                          icon: Icon(Icons.arrow_drop_down),
                                                          iconEnabledColor: Colors.black,
                                                          iconDisabledColor: Colors.grey,
                                                          iconSize: 26,
                                                          style: AppStyle.txtPoppinsBold14
                                                              .copyWith(letterSpacing: getHorizontalSize(0.5)),
                                                          underline: Container(height: 2, color: Colors.black),
                                                        ),),],),],),),),
                                          Container(
                                            margin: getMargin(left: 23, right: 23),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 10, right: 10,top: 1, bottom: 1),
                                              child:Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Select',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing: getHorizontalSize(0.5),
                                                          ),),
                                                        TextSpan(
                                                          text: ' Subject',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing: getHorizontalSize(0.5),
                                                          ),),],),),
                                                  Padding(
                                                    padding: EdgeInsets.only(),
                                                    child: DropdownButton<String>(
                                                      hint: Text('Software Testing'.tr),
                                                      value: _selectedSubject,
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          _selectedSubject = value!;
                                                        });},
                                                      items: <String>[
                                                        'Software Testing',
                                                        'Python',
                                                        'Java',
                                                        'C Programming Language',
                                                        'C++ Programming Language'
                                                      ].map<DropdownMenuItem<String>>((String value) {
                                                        return DropdownMenuItem<String>(
                                                          value: value,
                                                          child: Text(value,
                                                            style: TextStyle(
                                                              color: Colors.black54, // set the color of the dropdown items to black
                                                            ),),);
                                                      }).toList(),
                                                      focusNode: FocusNode(),
                                                      icon: Icon(Icons.arrow_drop_down),iconEnabledColor: Colors.black, iconDisabledColor: Colors.grey,
                                                      iconSize: 26,
                                                      style: AppStyle.txtPoppinsBold14
                                                          .copyWith(letterSpacing: getHorizontalSize(0.5),),
                                                      underline: Container(height: 2, color: Colors.black),
                                                    ),),],),),),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter details to update attendance manually',
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    SizedBox(height: 16.0),
                                    TextField(
                                      controller: _usnController,
                                      decoration: InputDecoration(
                                        labelText: 'USN',
                                      ),
                                    ),
                                    TextField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        labelText: 'Date (YYYY-MM-DD)',
                                      ),
                                    ),
                                    TextField(
                                      controller: _statusController,
                                      decoration: InputDecoration(
                                        labelText: 'Attendance Status (Present/Absent)',
                                      ),
                                    ),
                                    SizedBox(height: 16.0),
                                    ElevatedButton(
                                      onPressed: _submitAttendance,
                                      child: Text('Submit Attendance'),
                                    ),
                                  ],
                                ),
                              ),


                                   CustomButton(
                                      height: 56,
                                      text: "lbl_save".tr,
                                      margin: const EdgeInsets.only(top: 23),
                                      onTap: onTapSave)
                                ],
                              ),
                            ]),
                              ))]),
                              ))],
                      ),
                    ),
                  ),
        )));




  }

  onTapBtnArrowleft() {
    Get.back();
  }

  onTapSave() {
    Get.toNamed(AppRoutes.attendanceGraphPageScreen);
  }



}

