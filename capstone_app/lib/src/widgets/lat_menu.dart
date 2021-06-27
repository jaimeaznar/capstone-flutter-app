import 'package:capstone_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

Drawer lateralMenu(context) {
  return Drawer(
    elevation: 0.0,
    child: Container(
      color: colorBG,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/detail_app_bar_img.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'RECIPES APP',
                style: textLateralMenuStyle,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.fastfood,
              color: colorIcon,
            ),
            title: Text('Categories'),
            onTap: () {
              Navigator.pushNamed(context, 'category');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: colorIcon,
            ),
            title: Text('Help'),
            onTap: () {
              Navigator.pushNamed(context, 'category');
            },
          ),
        ],
      ),
    ),
  );
}
