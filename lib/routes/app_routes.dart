import 'package:flutter/material.dart';
import 'package:mally/main.dart';
import 'package:mally/presentation/home_screen/home_screen.dart';
import 'package:mally/presentation/photo_five_screen/photo_five_screen.dart';
import 'package:mally/presentation/photo_six_screen/photo_six_screen.dart';
import 'package:mally/presentation/home_plus_screen/home_plus_screen.dart';
import 'package:mally/presentation/photo_three_screen/photo_three_screen.dart';
import 'package:mally/presentation/photo_four_screen/photo_four_screen.dart';
import 'package:mally/presentation/photo_one_screen/photo_one_screen.dart';
import 'package:mally/presentation/profile_screen/profile_screen.dart';
import 'package:mally/presentation/photo_two_screen/photo_two_screen.dart';
import 'package:mally/presentation/home_minus_screen/home_minus_screen.dart';
import 'package:mally/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';

  static const String photoFiveScreen = '/photo_five_screen';

  static const String photoSixScreen = '/photo_six_screen';

  static const String homePlusScreen = '/home_plus_screen';

  static const String photoThreeScreen = '/photo_three_screen';

  static const String photoFourScreen = '/photo_four_screen';

  static const String photoOneScreen = '/photo_one_screen';

  static const String profileScreen = '/profile_screen';

  static const String photoTwoScreen = '/photo_two_screen';

  static const String homeMinusScreen = '/home_minus_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    homeScreen: (context) => HomeScreen(cameras: cameras,),
    photoFiveScreen: (context) => PhotoFiveScreen(),
    photoSixScreen: (context) => PhotoSixScreen(),
    homePlusScreen: (context) => HomePlusScreen(),
    photoThreeScreen: (context) => PhotoThreeScreen(),
    photoFourScreen: (context) => PhotoFourScreen(),
    photoOneScreen: (context) => PhotoOneScreen(cameras),
    profileScreen: (context) => ProfileScreen(),
    photoTwoScreen: (context) => PhotoTwoScreen(),
    homeMinusScreen: (context) => HomeMinusScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
