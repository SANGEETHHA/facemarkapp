import 'controller/sign_in_page_controller.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:facemarkapp/core/utils/validation_functions.dart';
import 'package:facemarkapp/widgets/custom_button.dart';
import 'package:facemarkapp/widgets/custom_icon_button.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:facemarkapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class SignInPageScreen extends StatefulWidget {
  SignInPageScreen({Key? key}) : super(key: key);

  @override
  _SignInPageScreenState createState() => _SignInPageScreenState();
}

class _SignInPageScreenState extends State<SignInPageScreen> {
  final String url = 'http://facemark.me:8000/dj-rest-auth/login/';
//  final FlutterSecureStorage _storage = FlutterSecureStorage();
  bool _rememberMe = false;
  final SignInPageController _signInPageController = SignInPageController();
  bool _isPasswordHidden = true;

  @override
  void initState() {
    super.initState();
  }


  Future<dynamic> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(url),
      //String url = "http://facemark.me"
      // Url.parse(url,'/dj-rest-auth/login/')
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      // You can handle the response data here as required
      print(responseData);
      Get.toNamed(AppRoutes.homePageContainerScreen);
    } else {
      throw Exception('Failed to login user');
    }
  }
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _isPasswordVisible = false.obs;
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
              child:Form(
                key: _formKey,
                child: Container(
                    height: size.height,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage2,
                        height: getVerticalSize(850),
                        width: getHorizontalSize(400),
                        alignment: Alignment.center),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                        padding: getPadding(
                        left: 18, top: 18, right: 18, bottom: 39),
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Padding(
                        padding: getPadding(left: 1, right: 7),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                      padding: getPadding(top: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      CustomIconButton(height: 39, width: 39,
                        margin: getMargin(left: 1),
                        onTap: () {
                        onTapBtnArrowleft();
                        },
                        child: CustomImageView(
                        svgPath: ImageConstant.imgArrowleftBlack90001)),
                      Padding(
                        padding: getPadding(top: 73),
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        RichText(
                        text: TextSpan(
                        children: [
                         TextSpan(
                          text: "lbl_hi".tr,
                          style: TextStyle(color: ColorConstant.black90001, fontSize: getFontSize(30), fontFamily: 'Poppins', fontWeight: FontWeight.w700)),
                         TextSpan(
                          text: "lbl_welcome".tr,
                          style: TextStyle(color: ColorConstant.whiteA700, fontSize: getFontSize(30), fontFamily: 'Poppins', fontWeight: FontWeight.w700))
                      ]),
                      textAlign: TextAlign.left),
                      CustomImageView(
                          imagePath: ImageConstant.imgImage296,
                          height: getSize(30),
                          width: getSize(30),
                          margin: getMargin(left: 7, top: 6, bottom: 10))
                      ]))])),
                      CustomImageView(
                          imagePath: ImageConstant.imgImage1,
                          height: getVerticalSize(96),
                          width: getHorizontalSize(92),
                          margin: getMargin(bottom: 32))
                      ])),
                      Padding(
                          padding: getPadding(left: 1, top: 50),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("lbl_email_address".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular14),
                                CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: _signInPageController.emailController,
                                  hintText: "msg_teacher_example_com".tr,
                                  margin: getMargin(top: 6),
                                  padding: TextFormFieldPadding.PaddingT18,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value, isRequired: true))) {
                                      return "Please enter valid email";
                                    }
                                    return null;},)])),


                    Padding(
                    padding: getPadding(left: 1, top: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular14,
                                ),
                      Obx(() =>
                          CustomTextFormField(
                                  focusNode: FocusNode(),
                                  controller: _signInPageController.passwordController,
                                  hintText: "lbl_password".tr,
                                  margin: getMargin(top: 6),
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.visiblePassword,
                                    suffix: InkWell(
                                      onTap: () {
                                        _signInPageController.isPasswordVisible.value = !_signInPageController.isPasswordVisible.value;
                                      },
                                      child: Container(
                                        margin: getMargin(left: 30, top: 21, right: 18, bottom: 22),
                                        child: Icon(
                                          _signInPageController.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                                          color: ColorConstant.gray500,
                                        ),
                                      ),
                                    ),
                                    suffixConstraints:
                                    BoxConstraints(maxHeight: getVerticalSize(56)),
                                    validator: (value) {
                                      if (value == null || (!isValidPassword(value, isRequired: true))) {
                                        return "Please enter valid password";
                                      }
                                      return null;
                                    },
                                    isObscureText: !_signInPageController.isPasswordVisible.value
                                )
                      )],),)
                    , Padding(padding: getPadding(left: 1, top: 15),
                                        child: Row(children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  value: _rememberMe,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _rememberMe = value ?? false;
                                                    });
                                                  },
                                                  // Add any additional styling here
                                                ),
                                                Text('Remember Me'),
                                              ],
                                            ),
                                          ),

                                        ])),
                                    CustomButton(
                                        height: getVerticalSize(56),
                                        text: "lbl_log_in".tr,
                                        margin: getMargin(left: 1, top: 54, bottom: 240),
                                        fontStyle: ButtonFontStyle.InterSemiBold16,
                                        onTap: onTapLogin)
                                  ])))
        ]))))))));}

  onTapBtnArrowleft() {
    Get.back();}

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  onTapLogin() async {
    Get.toNamed(AppRoutes.homePageContainerScreen);

    // if (_formKey.currentState!.validate()) {
    //   try {
    //     Map<String, dynamic> responseData = await loginUser(
    //       _signInPageController.emailController.text.trim(),
    //       _signInPageController.passwordController.text.trim(),
    //     );
    //     // save the user token to local storage or state management
    //     String? token = responseData['key'];
    //     if (token != null) {
    //       // navigate to home screen
    //       Get.offNamed(AppRoutes.homePageContainerScreen);
    //     } else {
    //       throw Exception('Failed to get token');
    //     }
    //   } catch (e) {
    //     Get.snackbar('Error', e.toString(),
    //         backgroundColor: ColorConstant.redA700);
    //   }
    // }
  }

}


