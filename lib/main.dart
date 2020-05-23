import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dosoally/DosuallyHome.dart';



void main() => runApp(MaterialApp(
  home: DosuallyHome(),
  theme: ThemeData(
    fontFamily: 'RobotoSlab',
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Color(0xFFFBE9E7),
    accentColor: Color(0xFF3FAAB8),
    cardTheme: CardTheme(
        color: Color(0xFFF6F6F6),
    ),
    toggleableActiveColor: Color(0xffD20000),
    appBarTheme: AppBarTheme(
        color: Color(0xFFFBE9E7), ),
    dividerColor: Colors.grey[400],
    // iOS transition for Android to get sliding animation instead of fading upwards animation
    pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
  ),

));








