import 'package:capstone_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

Widget categoryAppBar() {
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: iconColorAppBar,
    ),
  );
}
