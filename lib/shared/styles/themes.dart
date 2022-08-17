import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.deepOrange,
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black87,),
    color: Colors.white,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(color: Colors.black,),
    titleTextStyle: TextStyle(
      color: Colors.black87,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blueAccent,
    showUnselectedLabels: true,
    unselectedItemColor: Colors.black38,
    backgroundColor: Colors.grey,

  ),
  fontFamily: 'jannah',
  // floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //   backgroundColor: Colors.deepOrange,
  // ),

);
ThemeData darkTheme = ThemeData(
  primaryColor: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: Colors.deepOrange,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.deepOrange,
  ),
  appBarTheme:  AppBarTheme(
    color: HexColor('333739'),
    elevation: 0.0,
    actionsIconTheme: const IconThemeData(color: Colors.white,),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.black26,


  ),
  fontFamily: 'jannah',
);