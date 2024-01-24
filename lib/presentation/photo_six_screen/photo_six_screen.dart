import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';
import 'package:mally/widgets/custom_elevated_button.dart';

class PhotoSixScreen extends StatelessWidget {
  const PhotoSixScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 14.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 712.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgCapture1,
                                    height: 712.v,
                                    width: 393.h,
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 22.h,
                                            right: 6.h,
                                            bottom: 10.v),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              _buildCaptureOneSection(context),
                                              SizedBox(height: 152.v),
                                              CustomElevatedButton(
                                                  text: "Change Destination",
                                                  margin: EdgeInsets.only(
                                                      right: 16.h),
                                                  buttonStyle:
                                                      CustomButtonStyles
                                                          .fillBlue,
                                                  onPressed: () {
                                                    onTapChangeDestination(
                                                        context);
                                                  }),
                                              SizedBox(height: 10.v),
                                              CustomElevatedButton(
                                                  text: "Re-take the photo",
                                                  margin: EdgeInsets.only(
                                                      right: 16.h),
                                                  onPressed: () {
                                                    onTapRetakeThePhoto(
                                                        context);
                                                  })
                                            ])))
                              ])),
                      SizedBox(height: 15.v),
                      Container(
                          margin: EdgeInsets.only(left: 65.h, right: 59.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyle.roundedBorder15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapFrameThree(context);
                                    },
                                    child: Column(children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgIconMapPrimary,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      SizedBox(height: 13.v),
                                      Text("Map",
                                          style: theme.textTheme.labelLarge)
                                    ])),
                                Spacer(flex: 51),
                                Column(children: [
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgIconCameraOnprimary,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize),
                                  SizedBox(height: 11.v),
                                  Text("Photo",
                                      style:
                                          CustomTextStyles.labelLargeOnPrimary)
                                ]),
                                Spacer(flex: 48),
                                GestureDetector(
                                    onTap: () {
                                      onTapFrameOne(context);
                                    },
                                    child: Column(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgIconUser,
                                          height: 24.adaptSize,
                                          width: 24.adaptSize),
                                      SizedBox(height: 11.v),
                                      Text("Profile",
                                          style: theme.textTheme.labelLarge)
                                    ]))
                              ]))
                    ]))));
  }

  /// Section Widget
  Widget _buildCaptureOneSection(BuildContext context) {
    return Container(
        height: 216.v,
        width: 354.h,
        margin: EdgeInsets.only(left: 11.h),
        child: Stack(alignment: Alignment.bottomRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgWayInCircles,
              height: 216.v,
              width: 351.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: ImageConstant.imgFavorite,
              height: 28.v,
              width: 19.h,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(bottom: 71.v))
        ]));
  }

  /// Navigates to the photoThreeScreen when the action is triggered.
  onTapChangeDestination(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoThreeScreen);
  }

  /// Navigates to the photoOneScreen when the action is triggered.
  onTapRetakeThePhoto(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoOneScreen);
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
