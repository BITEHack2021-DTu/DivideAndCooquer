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

  Widget _stepToWidget(CookStep step) {
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

  Widget _ingretdientToWidget(Ingredient ingredient) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))
      ),
      child: ListTile(
        title: Text(ingredient.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;
    final List<CookStep> steps = recipe.cookSteps.sublist(1);
    final List<Ingredient> ingredients = recipe.ingredients;
    final List<Widget> stepsWidgets = steps
        .map((step) => _stepToWidget(step))
        .toList();
    final List<Widget> ingredientsWidgets = ingredients
        .map((ingredient) => _ingretdientToWidget(ingredient))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 26,
              )
            ),
            Column(
              children: ingredientsWidgets,
            ),
            Container(
              child: Text(
                  'Steps',
                  style: TextStyle(
                    fontSize: 26,
                  )
              ),
            ),
           Column(
             children: stepsWidgets,
           )
          ]
        ),
      ),
    );
  }
}
