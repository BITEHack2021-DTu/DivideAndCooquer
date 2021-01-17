import 'package:divide_and_cooquer/models/ingredient.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class RecipeView extends StatelessWidget {

  RecipeView({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    final List<CookStep> steps = recipe.cookSteps;
    final List<Ingredient> ingredients = recipe.ingredients;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        children: [
          // TODO: Make recipe name more visible, etc.
          Text(
            recipe.name,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          // TODO: Style this
          Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 22,
            )
          ),
          ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = ingredients[index];
                return ListTile(
                    title: Text(ingredient.name)
                );
              }
          ),
          Text(
              'Steps',
              style: TextStyle(
                fontSize: 22,
              )
          ),
          ListView.builder(
              itemCount: steps.length,
              itemBuilder: (BuildContext context, int index) {
                final step = steps[index];
                return ListTile(
                    title: Text(step.name)
                );
              }
          )
        ]
      ),
    );
  }
}
