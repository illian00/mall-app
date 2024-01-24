import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';
import 'package:mally/widgets/custom_elevated_button.dart';

class PhotoTwoScreen extends StatelessWidget {
  const PhotoTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 14.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgImage4,
                      height: 579.v,
                      width: 393.h),
                  SizedBox(height: 23.v),
                  Text("Do you want to proceed with this image?",
                      style: theme.textTheme.titleMedium),
                  SizedBox(height: 20.v),
                  _buildProceedButtons(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildNavbar(context)));
  }

  /// Section Widget
  Widget _buildProceedButtons(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomElevatedButton(
              height: 41.v,
              width: 150.h,
              text: "CANCEL",
              onPressed: () {
                onTapCANCEL(context);
              }),
          CustomElevatedButton(
              height: 41.v,
              width: 150.h,
              text: "PROCEED",
              margin: EdgeInsets.only(left: 29.h),
              buttonStyle: CustomButtonStyles.fillGreenA,
              onPressed: () {
                onTapPROCEED(context);
              })
        ]));
  }

  /// Section Widget
  Widget _buildNavbar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 65.h, right: 59.h, bottom: 15.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                  onTap: () {
                    onTapFrameThree(context);
                  },
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIconMapPrimary,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(top: 13.v),
                        child: Text("Map", style: theme.textTheme.labelLarge))
                  ])),
              Spacer(flex: 51),
              Column(mainAxisSize: MainAxisSize.min, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgIconCameraOnprimary,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(top: 11.v),
                    child: Text("Photo",
                        style: CustomTextStyles.labelLargeOnPrimary))
              ]),
              Spacer(flex: 48),
              GestureDetector(
                  onTap: () {
                    onTapFrameOne(context);
                  },
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIconUser,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(top: 11.v),
                        child:
                            Text("Profile", style: theme.textTheme.labelLarge))
                  ]))
            ]));
  }

  /// Navigates to the photoOneScreen when the action is triggered.
  onTapCANCEL(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoOneScreen);
  }

  /// Navigates to the photoThreeScreen when the action is triggered.
  onTapPROCEED(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoThreeScreen);
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapFrameThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapFrameOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }
}
