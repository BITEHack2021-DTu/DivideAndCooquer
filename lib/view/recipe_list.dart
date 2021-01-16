

import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/view/recipe_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeList extends StatelessWidget {
  RecipeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if(state is RecipesLoadInProgress) {
            return CircularProgressIndicator();
          } else if (state is RecipesLoadSuccess) {
            final recipes = state.recipes;
            return ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (BuildContext context, int index) {
                  final recipe = recipes[index];
                  return RecipeItem(
                      recipe: recipe,
                      onTap: () {
                        Navigator.of(context).pushNamed("/recipe", arguments: recipe);
                      }
                  );
                }
            );
          } else {
            return Container();
          }
        }
    );
  }
}
