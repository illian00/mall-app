import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';
import 'package:mally/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class PhotoFiveScreen extends StatelessWidget {
  PhotoFiveScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 15.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text("Clothes category",
                              style: theme.textTheme.titleMedium)),
                      SizedBox(height: 6.v),
                      CustomSearchView(
                          controller: searchController, hintText: "Search"),
                      SizedBox(height: 18.v),
                      GestureDetector(
                          onTap: () {
                            onTapTwo(context);
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgFrame6,
                                    height: 88.adaptSize,
                                    width: 88.adaptSize,
                                    radius: BorderRadius.circular(15.h)),
                                Container(
                                    width: 84.h,
                                    margin: EdgeInsets.only(
                                        left: 22.h, bottom: 21.v),
                                    child: Text("Pull & Bear \n-\nClothes",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(height: 1.38)))
                              ])),
                      SizedBox(height: 22.v),
                      _buildUserProfile(context,
                          userImage: ImageConstant.imgFrame688x88,
                          clothesLabel: "ZARA \n-\nClothes"),
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
                                width: 64.h,
                                margin:
                                    EdgeInsets.only(left: 22.h, bottom: 21.v),
                                child: Text("Bershka\n-\nClothes",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.38)))
                          ]),
                      SizedBox(height: 22.v),
                      _buildUserProfile(context,
                          userImage: ImageConstant.imgFrame888x88,
                          clothesLabel: "H&M \n- \nClothes"),
                      SizedBox(height: 22.v),
                      _buildUserProfile(context,
                          userImage: ImageConstant.imgFrame61,
                          clothesLabel: "OSTIN \n-\nClothes"),
                      SizedBox(height: 22.v),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame666x88,
                                height: 66.v,
                                width: 88.h,
                                radius: BorderRadius.vertical(
                                    top: Radius.circular(15.h))),
                            Container(
                                width: 80.h,
                                margin:
                                    EdgeInsets.only(left: 22.h, bottom: 27.v),
                                child: Text("LC WAIKIKI \n-",
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

  /// Common widget
  Widget _buildUserProfile(
    BuildContext context, {
    required String userImage,
    required String clothesLabel,
  }) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomImageView(
          imagePath: userImage,
          height: 88.adaptSize,
          width: 88.adaptSize,
          radius: BorderRadius.circular(15.h)),
      Container(
          width: 61.h,
          margin: EdgeInsets.only(left: 22.h, bottom: 21.v),
          child: Text(clothesLabel,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.onPrimary, height: 1.38)))
    ]);
  }

  /// Navigates to the photoSixScreen when the action is triggered.
  onTapTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoSixScreen);
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
