import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:divide_and_cooquer/view/recipe_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: BlocProvider(
        create: (context) {
          return RecipesBloc(
              RecipeRepository()
              )..add(RecipesLoaded());
        },
        child: RecipeApp(
          recipeList: false,
        ),
      )

    );
  }
}
