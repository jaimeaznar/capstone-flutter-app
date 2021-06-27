import 'package:capstone_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

Widget detailAppBar(String photo) {
  return SliverAppBar(
    backgroundColor: colorBG,
    expandedHeight: 200.0,
    floating: false,
    pinned: true,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: iconColorAppBar,
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
          placeholder: NetworkImage(photo),
          image: NetworkImage(photo),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover),
    ),
  );
}
