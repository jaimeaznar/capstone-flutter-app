import 'package:flutter/material.dart';
import 'package:capstone_app/src/styles/styles.dart';

Widget titles(String text, TextStyle textStyle) {
  return Container(
    alignment: AlignmentDirectional.topStart,
    margin: EdgeInsets.only(left: 30.0),
    child: Text(
      text,
      style: textStyle,
    ),
  );
}
