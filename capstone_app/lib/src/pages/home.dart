import 'package:capstone_app/provider/recipes_provider.dart';
import 'package:capstone_app/src/styles/styles.dart';
import 'package:capstone_app/src/viewModel/recipe_list.dart';
import 'package:capstone_app/src/widgets/app_bar.dart';
import 'package:capstone_app/src/widgets/categories_swipper.dart';
import 'package:capstone_app/src/widgets/lat_menu.dart';
import 'package:capstone_app/src/widgets/popular_swipper.dart';
import 'package:capstone_app/src/widgets/titles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: lateralMenu(context),
      key: _scaffoldKey,
      backgroundColor: colorBG,
      body: CustomScrollView(
        slivers: [
          appBar(context, _scaffoldKey),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  PopularSwipper(),
                  titles('Categories', titlesStyle),
                  categoriesSwipper(),
                  titles('Popular Recipes', titlesStyle),
                  // recipeList(context),
                  FutureBuilder(
                    future: recipesProvider.loadPopularRecipes(),
                    initialData: [],
                    builder: (BuildContext context,
                        AsyncSnapshot<List<dynamic>> snapshot) {
                      return Column(
                        children: recipesListVM(context, snapshot.data),
                      );
                    },
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
