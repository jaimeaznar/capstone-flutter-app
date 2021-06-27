import 'package:capstone_app/provider/recipes_provider.dart';
import 'package:capstone_app/src/styles/styles.dart';
import 'package:capstone_app/src/viewModel/recipe_list.dart';
import 'package:capstone_app/src/widgets/category_app_bar.dart';

import 'package:capstone_app/src/widgets/titles.dart';

import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> category =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: [
          categoryAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              titles(category['name'], titlesStyleCategory),
              FutureBuilder(
                future: recipesProvider.loadCategory(category['name']),
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Column(
                    children: recipesListVM(context, snapshot.data),
                  );
                },
              ),
              // PopularSwipper(),
            ]),
          ),
        ],
      ),
    );
  }
}
