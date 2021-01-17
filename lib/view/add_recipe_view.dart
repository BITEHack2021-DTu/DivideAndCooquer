import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:divide_and_cooquer/models/cuisines.dart';
import 'package:divide_and_cooquer/models/ingredient.dart';
import 'package:divide_and_cooquer/models/unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddRecipeView extends StatefulWidget {
  AddRecipeView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AddRecipeViewState();
}

class AddRecipeViewState extends State<AddRecipeView> {
  List<Ingredient> ingredients = [];
  List<CookStep> steps = [];

  List<Widget> ingredientItems = [];
  List<Widget> stepItems = [];

  addIngredient(ingredient) {
    ingredients.add(ingredient);
    ingredientItems.add(
        ListTile(
          title: Text(ingredient.toString()),
          trailing: Icon(Icons.delete),
        ));
  }
  removeIngredient(ingredient) {
    ingredientItems.remove(ingredients.indexOf(ingredient));
    ingredients.remove(ingredient);
  }

  addStep(step) {
    steps.add(step);
    stepItems.add(
        ListTile(
          title: Text(step.toString()),
          trailing: Icon(Icons.delete),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value.length < 3) {
                  return 'Recipe name has to be at least 3 characters long';
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              onChanged: (cuisine) {},
              items: Cuisines.values.map((Cuisines cuisine) {
                return DropdownMenuItem<Cuisines>(
                    value: cuisine,
                    child: Text(cuisine
                        .toString()
                        .substring(cuisine.toString().indexOf('.') + 1)));
              }).toList(),
              decoration: const InputDecoration(labelText: 'Cuisine'),
              validator: (value) {
                if (!value) {
                  return 'Please specify the cuisine';
                }
                return null;
              },
            ),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please specify the ingredient';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Quantity'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please specify quantity of the ingredient';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField(
                    onChanged: (unit) {},
                    items: Unit.values.map((Unit unit) {
                      return DropdownMenuItem<Unit>(
                          value: unit,
                          child: Text(unit
                              .toString()
                              .substring(unit.toString().indexOf('.') + 1)));
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Unit'),
                    validator: (value) {
                      if (!value) {
                        return 'Please specify the unit';
                      }
                      return null;
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement adding ingredient (quantity, unit and 'x' to remove from tmp ingredients list)
                      setState(() {
                        addIngredient(new Ingredient(name: 'Tmp'));
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
            ...ingredientItems,
          ],
        ),
      ),
    );
  }
}
