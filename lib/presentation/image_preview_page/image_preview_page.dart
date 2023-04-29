import 'package:facemarkapp/presentation/attendance_page_screen/attendance_page_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'controller/image_preview_controller.dart';
import 'models/image_preview_model.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:facemarkapp/presentation/home_page/home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class ImagePreviewPage extends StatefulWidget {
  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
//  late List<dynamic> _usns;

  late Image _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _image = Image.network('https://http://facemark.me:8000/path/to/image/image.jpg');
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = Image.file(File(pickedFile.path));

      });
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
              minHeight: MediaQuery.of(context).size.height,),
              child: IntrinsicHeight(
              child:Container(
                height: getVerticalSize(752),
                width: double.maxFinite,
                decoration: AppDecoration.fillTeal300,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgImage2,
                      height: getVerticalSize(839),
                      width: getHorizontalSize(390),
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: getPadding(top: 5),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: getMargin(top: 45),
                                    padding: getPadding(left: 19, right: 19),
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          // CustomIconButton(
                                          //     height: 39,
                                          //     width: 39,
                                          //     margin: getMargin(left: 1),
                                          //     onTap: () {
                                          //       onTapBtnArrowleft();
                                          //     },
                                          //     child: CustomImageView(
                                          //         svgPath: ImageConstant
                                          //             .imgArrowleftBlack90001)),
                                          Padding(
                                              padding: getPadding(top: 14),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "lbl_select".tr,
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .black90001,
                                                            fontSize:
                                                            getFontSize(30),
                                                            fontFamily:
                                                            'Poppins',
                                                            fontWeight:
                                                            FontWeight
                                                                .w700)),
                                                    TextSpan(
                                                        text: "lbl_image".tr,
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .whiteA700,
                                                            fontSize:
                                                            getFontSize(30),
                                                            fontFamily:
                                                            'Poppins',
                                                            fontWeight:
                                                            FontWeight
                                                                .w700))
                                                  ]),
                                                  textAlign: TextAlign.left))
                                        ])),
                                Spacer()
                              ]))),
                 ])))))));
  }

  onTapBtnArrowleft() {
    Get.back();
  }


  onTapBtnRetry() {
    setState(() {
      _image = Image.network('https://http://facemark.me:8000/path/to/image/image.jpg');
    });
  }

  // onTapBtnOk() async {
  //   if (_image != null) {
  //     try {
  //       final List usns =
  //           await sendImage(File('path/to/image/image.jpg'), 'your_token_here');
  //       setState(() {
  //         _usns = usns;
  //       });
  //       Get.toNamed(AppRoutes.attendancePageScreen, arguments: _usns);
  //     } catch (e) {
  //       Get.snackbar('Error', 'Failed to send image: $e');
  //     }
  //   } else {
  //     Get.snackbar('Error', 'Please capture an image first');
  //   }
  // }

//   Future<List<dynamic>> sendImage(File imageFile, String token) async {
//     final request = http.MultipartRequest(
//       'POST',
//       Uri.parse('http://facemark.me:8000/face/present/'),
//     );
//
//     final file = await http.MultipartFile.fromPath('image', imageFile.path);
//     request.files.add(file);
//     request.headers.addAll(<String, String>{'Authorization': 'Token $token'});
//
//     final response = await request.send();
//
//     if (response.statusCode == 200) {
//       final responseString = await response.stream.bytesToString();
//       return json.decode(responseString);
//     } else {
//       throw Exception('Failed to send image');
//     }
//   }
 }

