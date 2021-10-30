import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: MaterialColor(0xFFE74C3C, color),
  fontFamily: 'Georgia',
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
