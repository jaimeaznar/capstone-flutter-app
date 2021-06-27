import 'package:flutter/material.dart';
import 'package:capstone_app/src/styles/styles.dart';

List<Widget> recipesListSearch(
    BuildContext context, List<dynamic> recipes, String recipeQuery) {
  final List<Widget> recipeList = [];

  recipes.forEach((recipe) {
    var title = recipe['title'].toString().toLowerCase();

    if (title.contains(recipeQuery)) {
      final provisionalWidgetList =
          _recipeListBody(context, recipeTitlesStyle, recipe);
      recipeList.add(provisionalWidgetList);
    }
  });

  return recipeList;
}

Widget _recipeListBody(
    BuildContext context, TextStyle textStyle, Map<String, dynamic> recipe) {
  return Column(
    children: [
      SizedBox(
        height: 20.0,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'recipe', arguments: recipe);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            image: NetworkImage(recipe['photo']),
            fit: BoxFit.fill,
            width: 380.0,
            height: 140.0,
          ),
        ),
      ),
      Container(
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
      ),
    ],
  );
}
