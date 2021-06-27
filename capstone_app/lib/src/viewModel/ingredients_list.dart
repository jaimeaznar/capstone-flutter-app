import 'package:flutter/material.dart';

List<Widget> ingredientsList(List<dynamic> ingredients) {
  final List<Widget> ingredientsList = [];
  final List<dynamic> ingList = ingredients;

  ingList.forEach((ingredient) {
    final Widget provisionalWidget = _image(ingredient);
    ingredientsList.add(provisionalWidget);
  });
  return ingredientsList;
}

Widget _image(Map<String, dynamic> ingredient) {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 130.0,
          height: 100.0,
          margin: EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(ingredient['photoIngredient']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(
            ingredient['ingredient'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
