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
    final List<CookStep> steps = recipe.cookSteps.sublist(1);
    final List<Ingredient> ingredients = recipe.ingredients;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        children: [
          // TODO: Consider kicking this name container out as the name is now in the TopBar
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              recipe.name,
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono',
              ),
            ),
          ),
          // TODO: Style this
          Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 22,
            )
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = ingredients[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black26))
                    ),
                    child: ListTile(
                        title: Text(ingredient.name),
                      ),
                  );
                },
            ),
          ),
          Container(
            child: Text(
                'Steps',
                style: TextStyle(
                  fontSize: 22,
                )
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (BuildContext context, int index) {
                  final step = steps[index];
                  return Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black26))
                    ),
                    child: ListTile(
                      title: Text(step.name),
                      subtitle: Text(step.description),
                    ),
                  );
                }
            ),
          )
        ]
      ),
    );
  }
}
