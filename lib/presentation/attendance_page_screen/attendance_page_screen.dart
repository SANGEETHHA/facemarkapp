import 'controller/attendance_page_controller.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/presentation/manual_update_page/manual_update_page.dart';
import 'package:facemarkapp/presentation/image_preview_page/image_preview_page.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AttendancePageScreen extends StatefulWidget {
  final String selectedBranch;
  final String selectedSection;
  final String selectedSubject;
  final DateTime selectedDate;
  final String imagePath;

  AttendancePageScreen({
    required this.selectedBranch,
    required this.selectedSection,
    required this.selectedSubject,
    required this.selectedDate,
    required this.imagePath, required List<String> detectedUsns,
  });

  @override
  _AttendancePageScreenState createState() => _AttendancePageScreenState();
}

class _AttendancePageScreenState extends State<AttendancePageScreen> {
  List<String> detectedUSNs = [];

  final AttendancePageController _attendancePageController = AttendancePageController();

  @override
  void initState() {
    super.initState();
    detectStudentsInPhoto(widget.imagePath);
  }

  Future<void> detectStudentsInPhoto(String imagePath) async {
    var url = Uri.parse('http://facemark.me:8000//face/present/'); // Replace with actual URL
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('path/to/image/image.jpg', imagePath));
    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    var decodedResponse = json.decode(responseString);
    List<dynamic> usns = decodedResponse['usns'];
    setState(() {
      detectedUSNs = List<String>.from(usns);
    });}

  Future<List<String>> fetchBranches() async {
    var url = Uri.parse('http://facemark.me:8000//api/branch/'); // Replace with actual URL
    var response = await http.get(url);
    var decodedResponse = json.decode(response.body);
    List<dynamic> branches = decodedResponse['branches'];
    return List<String>.from(branches);
  }

  Future<List<String>> fetchSubjects() async {
    var url = Uri.parse('http://facemark.me:8000//api/subject/'); // Replace with actual URL
    var response = await http.get(url);
    var decodedResponse = json.decode(response.body);
    List<dynamic> subjects = decodedResponse['subjects'];
    return List<String>.from(subjects);
  }

  Future<List<String>> fetchSections() async {
    var url = Uri.parse('http://facemark.me:8000//api/section/'); // Replace with actual URL
    var response = await http.get(url);
    var decodedResponse = json.decode(response.body);
    List<dynamic> sections = decodedResponse['sections'];
    return List<String>.from(sections);
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
                                  Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                Text(
                                'Branch: ${widget.selectedBranch}',
                                style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                'Section: ${widget.selectedSection}',
                                style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                'Subject: ${widget.selectedSubject}',
                                style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                'Date: ${widget.selectedDate}',
                                style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                'Detected USNs:',
                                style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(height: 10.0),
                                Expanded(
                                child: ListView.builder(itemCount: detectedUSNs.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                                      child: Text(
                                        detectedUSNs[index],
                                        style: TextStyle(fontSize: 18.0),),);},),),],),),

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
                                          final image = await ImagePicker().getImage(source: ImageSource.camera);
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
                                    ),)])))]))),)))));
  }

  onTapBtnArrowleft() {
    final previousRoute = Get.previousRoute;
    if (previousRoute == null) {
      // No previous route, do nothing
      return;
    }
    Get.to(previousRoute);
  }


  onTapTxtButtonprimary() {
    Get.toNamed(AppRoutes.attendanceGraphPageScreen);
  }
}
