import 'package:flutter/material.dart';

class ReusableWidgets {
  static Widget textBuilder(
      {@required String text, double fontSize, FontWeight fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: TextAlign.center,
    );
  }
}
