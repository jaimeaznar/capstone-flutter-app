import 'package:capstone_app/src/styles/styles.dart';

import 'package:capstone_app/src/widgets/detailed_AppBar.dart';
import 'package:capstone_app/src/widgets/ingredients_swipper.dart';

import 'package:capstone_app/src/widgets/titles.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> recipe =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: [
          detailAppBar(recipe['photo']),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, right: 10.0, bottom: 10.0),
                  child: _recipeBody(recipe, detailRecipeTitlesStyle),
                  //recipeText(detailRecipeTitlesStyle),
                ),
                titles('Ingredients', titlesStyle),
                SizedBox(
                  height: 20.0,
                ),
                sliderIngredient(recipe['ingredients']),
                SizedBox(
                  height: 20.0,
                ),
                titles('Preparation', titlesStyle),
                _textDescription(recipe['preparation']),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _recipeBody(Map<String, dynamic> recipe, TextStyle textStyle) {
  return Container(
    alignment: AlignmentDirectional.topStart,
    margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Text(
          recipe['title'],
          textAlign: TextAlign.left,
          style: textStyle,
        ),
        Text(
          recipe['description'],
          textAlign: TextAlign.left,
          style: recipeDescriptionStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(Icons.alarm, color: colorIcon),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        recipe['duration'],
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          color: colorTitles,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Icon(Icons.fastfood, color: colorIcon),
                    Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Text(
                        recipe['dificulty'],
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.bold,
                          color: colorTitles,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _textDescription(String description) {
  return Container(
    margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
    child: Text(description,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
          color: Color.fromRGBO(15, 55, 91, 1.0),
          fontSize: 13.0,
        )),
  );
}
