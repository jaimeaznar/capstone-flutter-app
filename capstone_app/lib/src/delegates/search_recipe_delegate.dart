import 'package:capstone_app/provider/recipes_provider.dart';
import 'package:capstone_app/src/pages/recipe.dart';
import 'package:capstone_app/src/styles/styles.dart';
import 'package:capstone_app/src/viewModel/recipe_search.dart';
import 'package:flutter/material.dart';

class RecipeSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.primaryColorLight,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
      textTheme: theme.primaryTextTheme,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
        hintStyle: TextStyle(color: Colors.white60),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          this.query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: recipesProvider.loadPopularRecipes(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        List<dynamic> recipes = snapshot.data;
        var recipe_query = this.query.toLowerCase();

        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: recipesListSearch(context, recipes, recipe_query),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Search for your favourite recipe...',
        style: recipeDescriptionStyle,
      ),
    );
  }
}
