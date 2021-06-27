import 'package:capstone_app/src/delegates/search_recipe_delegate.dart';
import 'package:capstone_app/src/styles/styles.dart';
import 'package:flutter/material.dart';

Widget appBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return SliverAppBar(
    backgroundColor: colorBG,
    floating: false,
    leading: GestureDetector(
      onTap: () {
        key.currentState.openDrawer();
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Image(
          image: AssetImage('assets/menu.png'),
          width: 10.0,
          height: 10.0,
        ),
      ),
    ),
    actions: [
      Container(
        padding: EdgeInsets.all(20.0),
        child: IconButton(
          icon: Icon(
            Icons.search,
            color: Color.fromRGBO(183, 195, 206, 1.0),
            size: 25.0,
          ),
          onPressed: () {
            showSearch(
              context: context,
              delegate: RecipeSearchDelegate(),
            );
          },
        ),
      )
    ],
  );
}
