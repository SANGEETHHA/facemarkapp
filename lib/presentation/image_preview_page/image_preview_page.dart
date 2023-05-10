//import 'package:facemarkapp/presentation/attendance_page_screen/controller/attendance_page_controller.dart';
import 'package:facemarkapp/presentation/attendance_page_screen/attendance_page_screen.dart';
import 'package:facemarkapp/core/app_export.dart';
//import 'package:facemarkapp/presentation/home_page/controller/home_controller.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:facemarkapp/presentation/home_page/home_page.dart';
import 'dart:ui';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class ImagePreviewPage extends StatefulWidget {
  final String imagePath;
  final String branch;
  final String section;
  final String subject;
  final DateTime date;

  const ImagePreviewPage({Key? key, required this.imagePath,
  required this.branch,
  required this.section,
  required this.subject,
  required this.date,
  // required this.usns,
  }) : super(key: key);

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {

  late String _selectedBranch;
  late String _selectedSection;
  late String _selectedSubject;
  late DateTime _selectedDate;

  void _onSendImagePressed() async {
    final apiUrl = Uri.parse('http://facemark.me/face/recognise/');
    final imageFile = File(widget.imagePath);
    final request = http.MultipartRequest('POST', apiUrl)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print('API Response Status Code: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final usns = json.decode(response.body)?['result'];
        if (usns != null) {
          final usnList = List<String>.from(usns);
          print('Recognized USNs: $usnList');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AttendancePageScreen(
                branch: _selectedBranch,
                section: _selectedSection,
                subject: _selectedSubject,
                date: _selectedDate,
                //usns: usns,
              ),
            ),
          );
        } else {
          // Handle case where 'usns' is null
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to recognize faces. Please try again.'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to recognize faces. Please try again.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Exception occurred: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to send image. Please try again.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.teal300,
            body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: AppDecoration.fillTeal300,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                    height: 39,
                                    width: 39,
                                    margin: getMargin(left: 1),
                                    onTap: onTapBtnArrowleft,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowleftBlack90001,
                                    ),
                                  ),
                                  SizedBox(width: 10), // Add a SizedBox widget with width of 10
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'lbl_select'.tr,
                                          style: TextStyle(
                                            color: ColorConstant.black90001,
                                            fontSize: getFontSize(30),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                          ),),
                                        TextSpan(
                                          text: 'lbl_image'.tr,
                                          style: TextStyle(
                                            color: ColorConstant.whiteA700,
                                            fontSize: getFontSize(30),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),],),
                                    textAlign: TextAlign.left,
                                  ),],),
                              SizedBox(height: 10),
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(widget.imagePath),
                                    height: 300,
                                    width: 300,
                                    fit: BoxFit.cover,
                                  ),),),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: onTapBtnRetry,
                                    child: Text(
                                      'Retry',
                                      style: TextStyle(
                                        backgroundColor: Colors.black,
                                      ),),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: _onSendImagePressed,
                                    child: Text('Send Image'),
                                  ),
                                ],),
                              ElevatedButton(
                                onPressed:onTapAttendancePage ,
                                child: Text('Attendance page'),
                              ),
                            ],),),]),),),))));
  }

  onTapBtnArrowleft() {
    Get.offAll(Homepage());
  }

  onTapAttendancePage() {
    Get.toNamed(AppRoutes.attendancePageScreen);
  }

  onTapBtnRetry() {
    Navigator.pop(context);
  }
}
