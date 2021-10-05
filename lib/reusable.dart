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

  static Widget buttonBuilder(
      {@required String text, @required Function() onPressed}) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.blue, width: 3.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
