import '../controller/home_controller.dart';
import '../models/home_page_item_model.dart';
import 'package:facemarkapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageItemWidget extends StatelessWidget {
  HomePageItemWidget(this.homePageItemModelObj);

  HomePageItemModel homePageItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => Text(
              homePageItemModelObj.oneTxt.value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtPoppinsRegular12,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 43,
            ),
            child: Obx(
              () => Text(
                homePageItemModelObj.twoTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 41,
            ),
            child: Obx(
              () => Text(
                homePageItemModelObj.threeTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 40,
            ),
            child: Obx(
              () => Text(
                homePageItemModelObj.fourTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 40,
            ),
            child: Obx(
              () => Text(
                homePageItemModelObj.fiveTxt.value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
