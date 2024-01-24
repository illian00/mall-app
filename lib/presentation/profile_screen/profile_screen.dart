import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 15.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 21.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgImage3,
                          height: 180.adaptSize,
                          width: 180.adaptSize,
                          radius: BorderRadius.circular(90.h),
                          alignment: Alignment.center),
                      SizedBox(height: 17.v),
                      Align(
                          alignment: Alignment.center,
                          child: Text("Kengesbek Alisher",
                              style: CustomTextStyles.headlineSmallOnPrimary)),
                      SizedBox(height: 36.v),
                      Text("Frequently searched",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 18.v),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame63,
                                height: 88.adaptSize,
                                width: 88.adaptSize,
                                radius: BorderRadius.circular(15.h)),
                            Container(
                                width: 75.adaptSize,
                                margin:
                                    EdgeInsets.only(left: 22.h, bottom: 21.v),
                                child: Text("Bahandi \n-\nFood",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.38)))
                          ]),
                      SizedBox(height: 22.v),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame888x88,
                                height: 88.adaptSize,
                                width: 88.adaptSize,
                                radius: BorderRadius.circular(15.h)),
                            Container(
                                width: 75.h,
                                margin:
                                    EdgeInsets.only(left: 22.h, bottom: 21.v),
                                child: Text("H&M \n- \nClothes",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.38)))
                          ]),
                      SizedBox(height: 22.v),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame8,
                                height: 88.adaptSize,
                                width: 88.adaptSize,
                                radius: BorderRadius.circular(15.h)),
                            Container(
                                width: 75.h,
                                margin:
                                    EdgeInsets.only(left: 22.h, bottom: 21.v),
                                child: Text("Berhska \n- \nClothes",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.38)))
                          ]),
                      SizedBox(height: 22.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgFrame9,
                            height: 48.v,
                            width: 88.h,
                            radius: BorderRadius.vertical(
                                top: Radius.circular(15.h))),
                        Container(
                            width: 30.h,
                            margin: EdgeInsets.only(left: 22.h, bottom: 3.v),
                            child: Text("KFC \n-\n Food",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(height: 1.38)))
                      ])
                    ])),
            bottomNavigationBar: _buildNavbar(context)));
  }

  /// Section Widget
  Widget _buildNavbar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 65.h, right: 59.h, bottom: 15.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
            height: 92,
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
              GestureDetector(
                  onTap: () {
                    onTapFrameTwo(context);
                  },
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgIconCamera,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(top: 11.v),
                        child: Text("Photo", style: theme.textTheme.labelLarge))
                  ])),
              Spacer(flex: 48),
              Column(mainAxisSize: MainAxisSize.min, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgIconUserOnprimary,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(top: 11.v),
                    child: Text("Profile",
                        style: CustomTextStyles.labelLargeOnPrimary))
              ])
            ]));
  }

  /// Navigates to the homeScreen when the action is triggered.
  onTapFrameThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  /// Navigates to the photoOneScreen when the action is triggered.
  onTapFrameTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoOneScreen);
  }
}
