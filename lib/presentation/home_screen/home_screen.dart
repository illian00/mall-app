//import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mally/core/app_export.dart';
import 'package:mally/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  //Completer<GoogleMapController> googleMapController = Completer();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.08917695970497, 71.40717226995122);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                height: 712.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.bottomRight, children: [
                  _buildMapSection(context),
                  _buildFloatingActionButtonSection(context), _buildSearchBarSection(context),
                ])),
            bottomNavigationBar: _buildNavbarSection(context)));
            //floatingActionButton: _buildFloatingActionButtonSection1(context)));
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
        height: 712.v,
        width: double.maxFinite,
        child: GoogleMap(
          padding: EdgeInsets.only(bottom: 80, right: 10, left: 10),
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.4746),
            onMapCreated: _onMapCreated,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true));
  }

  /// Section Widget
  Widget _buildFloatingActionButtonSection(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(bottom: 10.v, left: 10.h, right: 10.h),
      child: Row(
        children:[
          Container(
            margin: EdgeInsets.only(left: 10.h),
            child: CustomFloatingButton(
            height: 44,
            width: 44,
            backgroundColor: appTheme.whiteA700,
            alignment: Alignment.bottomLeft,
            child: CustomImageView(
                imagePath: ImageConstant.imgIconLayers,
                height: 22.0.v,
                width: 22.0.h))
    ),
          Container(
            margin: EdgeInsets.only(left: 242.h),
            child:CustomFloatingButton(
                      height: 44,
                      width: 44,
                      alignment: Alignment.bottomLeft,
                      backgroundColor: appTheme.whiteA700,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgIconBookmark,
                          height: 22.0.v,
                          width: 22.0.h))
          )]
      ));
  }

  Widget _buildSearchBarSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(16),
      child: SearchBar(
        leading: const Icon(Icons.search),
        trailing: <Widget>[
                Tooltip(
                  message: 'Voice command',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic),
                  ),
                )
              ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNavbarSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 65.h, right: 59.h, bottom: 15.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
            height: 100,
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
  /*Widget _buildFloatingActionButtonSection1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.h, bottom: 10.v),
      child: CustomFloatingButton(
          height: 44,
          width: 44,
          alignment: Alignment.bottomLeft,
          backgroundColor: appTheme.whiteA700,
          child: CustomImageView(
              imagePath: ImageConstant.imgIconBookmark,
              height: 22.0.v,
              width: 22.0.h))
    );
  }*/

  /// Navigates to the photoOneScreen when the action is triggered.
  onTapFrameTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.photoOneScreen, arguments: cameras);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapFrameOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }
}
