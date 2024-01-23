import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

var lightTheme = FlexThemeData.light(

  scheme: FlexScheme.mandyRed,
  background: Colors.white,
  colors: const FlexSchemeColor(
    primary: Colors.deepPurple,
    secondary: Colors.pinkAccent,
    error: Colors.red,
    swapOnMaterial3: true,
    secondaryContainer: Colors.black,
  ),
 fontFamily:'roboto',
    useMaterial3: true,
    onPrimary: Colors.deepPurple,
    onSecondary: Colors.pinkAccent,
    error: Colors.redAccent,
    scaffoldBackground: Colors.white,
    appBarStyle:FlexAppBarStyle.material,
    appBarBackground: Colors.deepPurple,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20.0),
        labelSmall: TextStyle(fontSize: 13.0),
        displaySmall: TextStyle(fontSize: 12.0),
        titleLarge: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.bold),
        displayLarge: TextStyle(fontSize: 14.0),
        displayMedium: TextStyle(fontSize: 14.0),
        headlineMedium: TextStyle(fontSize: 14.0),
        headlineSmall: TextStyle(fontSize: 14.0),
        titleMedium: TextStyle(fontSize: 14.0),
        titleSmall: TextStyle(fontSize: 14.0),
        bodyMedium: TextStyle(fontSize: 14.0),
        bodySmall: TextStyle(fontSize: 14.0),
        labelLarge: TextStyle(fontSize: 14.0),
    ),

);
