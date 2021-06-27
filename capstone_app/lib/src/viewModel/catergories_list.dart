import 'package:capstone_app/provider/recipes_provider.dart';
import 'package:flutter/material.dart';

List<Widget> categoriesList(BuildContext context) {
  final List<Widget> categories_list = [];
  final List<dynamic> categories = recipesProvider.categories;

  categories.forEach((category) {
    final Widget provisionalWidget = _categoryImage(context, category);
    categories_list.add(provisionalWidget);
  });
  return categories_list;
}

Widget _categoryImage(BuildContext context, Map<String, dynamic> category) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'category', arguments: category);
    },
    child: Stack(
      children: [
        Container(
          width: 130.0,
          height: 100.0,
          margin: EdgeInsets.only(right: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(category['photo']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20.0),
          child: Text(
            category['name'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
        ),
      ],
    ),
  );
}
