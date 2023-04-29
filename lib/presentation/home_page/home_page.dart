import 'dart:io';
import 'package:facemarkapp/presentation/image_preview_page/image_preview_page.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:facemarkapp/widgets/app_bar/appbar_image.dart';
import 'package:facemarkapp/widgets/app_bar/custom_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  String? _selectedBranch;
  String? _selectedSection;
  late DateTime _selectedDate;
  String? _selectedSubject;
  late Image _image;

  _HomePageState() {
    _selectedDate = DateTime.now();
  }
  late File _imageFile;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _imageFile = File('assets/images/default_image.jpg');
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImagePreviewPage(image: Image.file(_imageFile)),
          ),
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.teal300,
            body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: IntrinsicHeight(
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage2,
                          height: getVerticalSize(850),
                          width: getHorizontalSize(400),
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: getPadding(top: 5),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomAppBar(
                                    height: getVerticalSize(142),
                                    title: Padding(
                                      padding: getPadding(
                                        left: 23,
                                        top: 10,
                                      ),
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
                                      ),
                                    ),
                                    actions: [
                                      AppbarImage(
                                        height: getVerticalSize(96),
                                        width: getHorizontalSize(92),
                                        imagePath: ImageConstant.imgImage1,
                                        margin: getMargin(
                                          left: 25,
                                          right: 25,
                                          bottom: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: getMargin(
                                          left: 5,
                                          right: 5,
                                        ),
                                        child: Padding(
                                          padding: getPadding(
                                              right: 1.5,
                                              left:
                                                  1.5), // Add padding of 16 pixels on all sides
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Select',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.5),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' Branch',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 1, bottom: 1),
                                                    child:
                                                        DropdownButton<String>(
                                                      hint: Text(
                                                          'Aeronautical Engineering'
                                                              .tr),
                                                      value: _selectedBranch,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          _selectedBranch =
                                                              value;
                                                        });
                                                      },
                                                      items: <String>[
                                                        'Aeronautical Engineering',
                                                        'Tool Engineering',
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54, // set the color of the dropdown items to black
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      focusNode: FocusNode(),
                                                      icon: Icon(Icons
                                                          .arrow_drop_down),
                                                      iconEnabledColor:
                                                          Colors.black,
                                                      iconDisabledColor:
                                                          Colors.grey,
                                                      iconSize: 26,
                                                      style: AppStyle
                                                          .txtPoppinsBold14
                                                          .copyWith(
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.5),
                                                      ),
                                                      underline: Container(
                                                          height: 2,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Select',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.5),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: ' Section',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                getHorizontalSize(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 1, bottom: 1),
                                                    child:
                                                        DropdownButton<String>(
                                                      hint: Text('A'.tr),
                                                      value: _selectedSection,
                                                      onChanged:
                                                          (String? value) {
                                                        setState(() {
                                                          _selectedSection =
                                                              value;
                                                        });
                                                      },
                                                      items: <String>[
                                                        'A',
                                                        'B',
                                                        'C',
                                                        'D'
                                                      ].map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black54, // set the color of the dropdown items to black
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                      focusNode: FocusNode(),
                                                      icon: Icon(Icons
                                                          .arrow_drop_down),
                                                      iconEnabledColor:
                                                          Colors.black,
                                                      iconDisabledColor:
                                                          Colors.grey,
                                                      iconSize: 26,
                                                      style: AppStyle
                                                          .txtPoppinsBold14
                                                          .copyWith(
                                                              letterSpacing:
                                                                  getHorizontalSize(
                                                                      0.5)),
                                                      underline: Container(
                                                          height: 2,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: getMargin(left: 23, right: 23),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 1,
                                              bottom: 1),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Select',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.5),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: ' Subject',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        letterSpacing:
                                                            getHorizontalSize(
                                                                0.5),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(),
                                                child: DropdownButton<String>(
                                                  hint: Text(
                                                      'Software Testing'.tr),
                                                  value: _selectedSubject,
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      _selectedSubject = value!;
                                                    });
                                                  },
                                                  items: <String>[
                                                    'Software Testing',
                                                    'Python',
                                                    'Java',
                                                    'C Programming Language',
                                                    'C++ Programming Language'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .black54, // set the color of the dropdown items to black
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  focusNode: FocusNode(),
                                                  icon: Icon(
                                                      Icons.arrow_drop_down),
                                                  iconEnabledColor:
                                                      Colors.black,
                                                  iconDisabledColor:
                                                      Colors.grey,
                                                  iconSize: 26,
                                                  style: AppStyle
                                                      .txtPoppinsBold14
                                                      .copyWith(
                                                    letterSpacing:
                                                        getHorizontalSize(0.5),
                                                  ),
                                                  underline: Container(
                                                      height: 2,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 25,
                                        ),
                                        child: Container(
                                          width: double.maxFinite,
                                          margin: getMargin(
                                            left: 8,
                                            right: 8,
                                            top: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.white,
                                                Color(0xFFFFFFFF),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder25,
                                          ),
                                          child: CalendarDatePicker(
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1000),
                                            lastDate: DateTime(3030),
                                            onDateChanged: (DateTime date) {
                                              // Do something
                                            },
                                          ),
                                          padding: getPadding(
                                            left: 7,
                                            top: 7,
                                            right: 7,
                                            bottom: 7,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: _selectedBranch != null &&
                                                _selectedSubject != null &&
                                                _selectedSection != null &&
                                                _selectedDate != null
                                            ? () => pickImage().then((value) {})
                                            : null,
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.disabled)) {
                                                return Colors.black38;
                                              }
                                              return Colors.black;
                                            },
                                          ),
                                        ),
                                        child: Text(
                                          'Capture Attendance',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ))
                    ]))))));
  }
}

class MyRaisedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const MyRaisedButton({Key? key, required this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(buttonText),
      onPressed: onPressed,
    );
  }
}
