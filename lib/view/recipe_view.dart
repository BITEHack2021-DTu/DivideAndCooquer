import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeView extends StatelessWidget {
  final Recipe recipe;
  final Ingredient[] ingredients;
  final Step[] steps;

  RecipeView({
    Key key,
    @required this.recipe
  }) :  this.ingredients = recipe.ingredients,
        this.steps = recipe.steps,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TODO: Make recipe name more visible, etc.
        Text(
          this.recipe.name,
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
            itemCount: this.ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              final ingredient = this.ingredients[index];
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
            itemCount: this.steps.length,
            itemBuilder: (BuildContext context, int index) {
              final step = this.steps[index];
              return ListTile(
                  title: Text(step.name)
              );
            }
        )
      ],
    )
  }
}
