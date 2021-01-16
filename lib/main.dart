import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:divide_and_cooquer/view/app.dart';
import 'package:flutter/material.dart';

import 'JsonPage.dart';

void main() => runApp(App());

class MyApp extends StatelessWidget {

  void load() {
    RecipeRepository recipeRepository = RecipeRepository();
    recipeRepository.loadRecipes();
  }


  @override
  Widget build(BuildContext context) {
    load();

    return MaterialApp(
      title: 'Divide And Cooquer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: JsonPage(),
    );
  }
}