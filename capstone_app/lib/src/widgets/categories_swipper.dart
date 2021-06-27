import 'package:capstone_app/provider/recipes_provider.dart';
import 'package:capstone_app/src/viewModel/catergories_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class categoriesSwipper extends StatelessWidget {
  final controller = PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return FutureBuilder(
            future: recipesProvider.loadCategories(),
            initialData: [],
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return PageView(
                controller: controller,
                children: categoriesList(context),
              );
            },
          );
        },
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }

  Widget _categoryImage(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'category');
      },
      child: Container(
        child: Image(
          image: AssetImage('assets/recipe-slider1.png'),
        ),
      ),
    );
  }
}
