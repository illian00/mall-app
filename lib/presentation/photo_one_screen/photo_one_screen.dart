import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:syncfusion_flutter_sliders/sliders.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:url_launcher/url_launcher_string.dart';

class PhotoOneScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  PhotoOneScreen(this.cameras);

  @override
  State<PhotoOneScreen> createState() => _PhotoOneScreenState();
}

class _PhotoOneScreenState extends State<PhotoOneScreen> {
  late CameraController controller;
  bool isCapturing = false;
  //For switching cameras
  int _selectedCameraIndex = 0;
  bool _isFrontCamera = false;
  //For flash
  bool _isFlashOn = false;
  //For focusing
  Offset? _focusPoint;
  //For Zoom
  double _currentZoom = 1.0;
  File? _capturedImage;
  //For making sound
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _toggleFlashLight(){
    if(_isFlashOn) {
      controller.setFlashMode(FlashMode.off);
      setState(() {
        _isFlashOn = false;
      });
    }
    else {
      controller.setFlashMode(FlashMode.torch);
      setState(() {
        _isFlashOn =true;
      });
    }
  }

  void _switchCamera() async {
    if(controller != null){
      //Dispose the current controller to release the camera resource
      await controller.dispose();
    }
    //Increment or reset the selected camera index
    _selectedCameraIndex = (_selectedCameraIndex + 1) % widget.cameras.length;
    //Initialize the new camera
    _initCamera(_selectedCameraIndex);
  }

  Future<void> _initCamera(int cameraIndex) async {
    controller = CameraController(widget.cameras[cameraIndex], ResolutionPreset.max);

    try {
      await controller.initialize();
      setState(() {
        if(cameraIndex == 0) {
          _isFrontCamera = false;
        }
        else {
          _isFrontCamera = true;
        }
      });
    }
    catch (e) {
      print("Error message: ${e}");
    }

    if(mounted) {
      setState(() {
        
      });
    }
  }

  void capturePhoto() async {
    if(!controller.value.isInitialized) {
      return;
    }

    final Directory appDir = await path_provider.getApplicationSupportDirectory();
    final String capturePath = path.join(appDir.path, '${DateTime.now()}.png');

    if(controller.value.isTakingPicture) {
      return;
    }

    try {
      setState(() {
        isCapturing = true;
      });

      final XFile capturedImage = await controller.takePicture();
      String imagePath = capturedImage.path;
      await GallerySaver.saveImage(imagePath);
      print("Photo captured and saved to gallery");

      //Play a sound effect
      audioPlayer.open(Audio("music/camera_click.mp3"));
      audioPlayer.play();

      //For showing image in the left
      final String filePath = '$capturePath/${DateTime.now().millisecondsSinceEpoch}.png';
      _capturedImage = File(capturedImage.path);
      _capturedImage!.renameSync(filePath);

    } catch (e) {
      print("Error capturing photo: $e");
    } finally {
      setState(() {
        isCapturing = false; 
      });
    }
  }

  void zoomCamera(double value) {
    setState(() {
      _currentZoom = value;
      controller.setZoomLevel(value);
    });
  }

  Future<void> _setFocusPoint(Offset point) async {
    if(controller != null && controller.value.isInitialized) {
      try {
        final double x = point.dx.clamp(0.0, 1.0);
        final double y = point.dy.clamp(0.0, 1.0);
        await controller.setFocusPoint(Offset(x, y));
        await controller.setFocusMode(FocusMode.auto);
        setState(() {
          _focusPoint = Offset(x, y);
        });

        //Reset _focusPoint after a short delay to remove the square
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _focusPoint = null;
        });
      } catch (e) {
        print("Failed to set focus: $e");
      }
    }
  }
/*
  Future<void> openGallery() async {
    // Specify the URI for opening the gallery app
    const String galleryAppUri = 'content://media/internal/images/media';

    try {
      // Check if the platform-specific gallery app can be launched
        await launchUrl(Uri.parse(galleryAppUri));
     
    } catch (e) {
      // Handle any errors that occur during the launching process
      print('Error launching the gallery app: $e');
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              _toggleFlashLight();
                            },
                            child: _isFlashOn == false ? Icon(Icons.flash_off, color: Colors.white) : Icon(Icons.flash_on, color: Colors.white)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap:() {
                              
                            },
                            child: Icon(Icons.qr_code_scanner, color: Colors.white)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Positioned.fill(
                  top: 50,
                  bottom: _isFrontCamera == false ? 0 : 150,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        final Offset tapPosition = details.localPosition;
                        final Offset relativeTapPosition = Offset(
                          tapPosition.dx / constraints.maxWidth, 
                          tapPosition.dy / constraints.maxHeight,
                          );
                        _setFocusPoint(relativeTapPosition);  
                      },
                      child: CameraPreview(controller)
                    ),
                  ),
                ),
                
                Positioned(
                  top: 50,
                  right: 10,
                  child: SfSlider.vertical(
                    max: 5.0,
                    min: 1.0,
                    activeColor: Colors.white,
                    value: _currentZoom,
                    onChanged: (dynamic value){
                      setState(() {
                        zoomCamera(value);
                      });
                    },
                  ),
                ),

                if(_focusPoint != null) 
                  Positioned.fill(
                    top: 50,
                    child: Align(
                      alignment: Alignment(_focusPoint!.dx * 2 - 1, _focusPoint!.dy * 2 - 1),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    )
                  ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: _isFrontCamera == false ?  Colors.black45 : Colors.black,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text("Video",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),    
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Photo",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Settings",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        _capturedImage != null
                                        ? Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.file(
                                                _capturedImage!,
                                                fit: BoxFit.cover,
                                              ),
                                        ): Container(),
                                      ],
                                    ), 
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        capturePhoto();
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(
                                              width: 4,
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                            )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _switchCamera();
                                      },
                                      child: Icon(Icons.cameraswitch_sharp, color: Colors.white, size: 40,),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ), 
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:mally/core/app_export.dart';
import 'package:camera/camera.dart';
*/
/*class PhotoOneScreen extends StatelessWidget {
  const PhotoOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 0.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgImage1,
                      height: 605.v,
                      width: 393.h),
                  SizedBox(
                      height: 96.v,
                      width: double.maxFinite,
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgImage196x393,
                            height: 96.v,
                            width: 393.h,
                            alignment: Alignment.center),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                height: 75.v,
                                width: 93.h,
                                margin:
                                    EdgeInsets.only(left: 11.h, bottom: 8.v),
                                decoration: BoxDecoration(
                                    color:
                                        theme.colorScheme.onPrimaryContainer)))
                      ])),
                  Container(
                      height: 10.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: appTheme.black900))
                ])),
            bottomNavigationBar: _buildNavbarRow(context)));
  }

  /// Section Widget
  Widget _buildNavbarRow(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 65.h, right: 59.h, bottom: 15.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder15),
            height: 90,
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

  /// Navigates to the homeScreen when the action is triggered.
  onTapFrameThree(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeScreen);
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapFrameOne(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileScreen);
  }
}
*/