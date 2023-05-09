import 'package:facemarkapp/presentation/attendance_page_screen/controller/attendance_page_controller.dart';
import 'package:facemarkapp/presentation/attendance_page_screen/attendance_page_screen.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:facemarkapp/presentation/home_page/home_page.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class ImagePreviewPage extends StatefulWidget {
  final File image;
  const ImagePreviewPage({Key? key, required this.image}) : super(key: key);

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  Future<void> sendImageToAPI() async {
    String apiUrl = 'http://facemark.me:8000/face/recognise/';
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      var pic = await http.MultipartFile.fromPath("image", _image.path);
      request.files.add(pic);
      var response = await request.send();
      print("response code:");
      print(response.statusCode);
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var jsonResponse = json.decode(responseString);
      print(jsonResponse);

      List<String> usns = List<String>.from(jsonResponse['usns']);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AttendancePageScreen(usns: usns),
        ),
      );    } catch (e) {
      print('Error: $e');
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
                                    _image,
                                    height: MediaQuery.of(context).size.height * 0.75,
                                    width: MediaQuery.of(context).size.width * 1.0, // Set the width to 80% of the screen width
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
                                    onPressed: sendImageToAPI,
                                    child: Text(
                                      'Send Image',
                                      style: TextStyle(
                                        backgroundColor: Colors.black,
                                      ),),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                    ),),
                                ],),
                            ],),),]),),),))));
  }

  onTapBtnArrowleft() {
    Get.offAll(Homepage());
  }

  onTapBtnRetry() {
    Navigator.pop(context);
  }
}
