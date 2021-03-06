import 'package:capstone_app/src/viewModel/ingredients_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

final controller = PageController(initialPage: 1, viewportFraction: 0.3);

Widget sliderIngredient(List<dynamic> ingredients) {
  return Container(
    height: 120.0,
    padding: EdgeInsets.only(left: 5.0),
    child: Swiper(
      itemCount: 3,
      layout: SwiperLayout.DEFAULT,
      itemBuilder: (BuildContext context, int index) {
        return PageView(
          controller: controller,
          children: ingredientsList(ingredients),
        );
      },
    ),
  );
}
