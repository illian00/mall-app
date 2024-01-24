import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mally/core/app_export.dart';
import 'package:mally/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class HomePlusScreen extends StatelessWidget {
  HomePlusScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: 712.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  _buildMapSection(context),
                  _buildFortyEightSection(context)
                ])),
            bottomNavigationBar: _buildNavbarSection(context),
            floatingActionButton: _buildFloatingActionButtonSection(context)));
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
        height: 712.v,
        width: double.maxFinite,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Section Widget
  Widget _buildFortyEightSection(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 22.h, right: 22.h, bottom: 22.v),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomFloatingButton(
                  height: 44,
                  width: 44,
                  backgroundColor: appTheme.whiteA700,
                  alignment: Alignment.centerRight,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconMinus,
                      height: 22.0.v,
                      width: 22.0.h)),
              SizedBox(height: 282.v),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomFloatingButton(
                    height: 44,
                    width: 44,
                    backgroundColor: appTheme.whiteA700,
                    child: CustomImageView(
                        imagePath: ImageConstant.imgIconBookmark,
                        height: 22.0.v,
                        width: 22.0.h)),
                CustomFloatingButton(
                    height: 44,
                    width: 44,
                    backgroundColor: appTheme.whiteA700,
                    child: CustomImageView(
                        imagePath: ImageConstant.imgIconLayers,
                        height: 22.0.v,
                        width: 22.0.h))
              ])
            ])));
  }

  /// Section Widget
  Widget _buildNavbarSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 65.h, right: 59.h, bottom: 15.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgIconMap,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(top: 13.v),
                    child: Text("Map",
                        style: CustomTextStyles.labelLargeOnPrimary))
              ]),
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

  /// Section Widget
  Widget _buildFloatingActionButtonSection(BuildContext context) {
    return CustomFloatingButton(
        height: 44,
        width: 44,
        backgroundColor: appTheme.whiteA700,
        child: CustomImageView(
            imagePath: ImageConstant.imgIconPlus,
            height: 22.0.v,
            width: 22.0.h));
  }

  /// Navigates to the photoOneScreen when the action is triggered.
  onTapFrameTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoOneScreen);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapFrameOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }
}
