import 'package:flutter/material.dart';

class Layout {
  static Color lightGrey = Colors.grey[100];
  static Color mediumGrey = Colors.grey[300];
  static Color darkBlueGrey = Colors.blueGrey[800];
  static Color lightOrange = Colors.orange[700];
  static Color darkOrange = Colors.orange[900];

  static LinearGradient orangeGradient = LinearGradient(
                colors: [Colors.orange[900], Layout.lightOrange]);

  static TextStyle lightBold = TextStyle(fontWeight: FontWeight.w500);
  static TextStyle mediumBold = TextStyle(fontWeight: FontWeight.w500);
  static TextStyle ultraBold = TextStyle(fontWeight: FontWeight.w800);
  static TextStyle circleButtonTextStyle = TextStyle(fontSize: 15, color: Colors.blueGrey[700]);
}