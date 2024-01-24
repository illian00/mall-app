import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mally/theme/theme_helper.dart';
import 'package:mally/routes/app_routes.dart';

import 'presentation/home_screen/home_screen.dart';

List<CameraDescription> cameras = [];

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'mally',
      debugShowCheckedModeBanner: false,
      //initialRoute: AppRoutes.homeScreen,
      routes: AppRoutes.routes,
      home: HomeScreen(cameras: cameras),
    );
  }
}
