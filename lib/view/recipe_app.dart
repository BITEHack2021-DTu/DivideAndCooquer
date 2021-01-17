

import 'package:divide_and_cooquer/view/recipe_list.dart';
import 'package:flutter/material.dart';

import 'top_bar.dart';


class RecipeApp extends StatelessWidget {

  RecipeApp({Key key, bool recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Center(
        child: RecipeList(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}