import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:divide_and_cooquer/models/cuisines.dart';
import 'package:divide_and_cooquer/models/ingredient.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/models/unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Unit unit;
  Cuisines cuisine;

  final _formKey = GlobalKey<FormState>();
  final _ingredientKey = GlobalKey<FormState>();
  final _stepKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ingNameController = TextEditingController();
  final _ingQuantityController = TextEditingController();
  final _stepNameController = TextEditingController();
  final _stepDescriptionController = TextEditingController();

  addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
    ingredientItems.add(ListTile(
        title: Text(ingredient.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              removeIngredient(ingredient);
            });
          },
        )));
  }

  removeIngredient(Ingredient ingredient) {
    ingredientItems.removeAt(ingredients.indexOf(ingredient));
    ingredients.remove(ingredient);
  }

  addStep(CookStep step) {
    steps.add(step);
    stepItems.add(ListTile(
        title: Text(step.toString()),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            setState(() {
              removeStep(step);
            });
          },
        )));
  }

  removeStep(CookStep step) {
    stepItems.removeAt(steps.indexOf(step));
    steps.remove(step);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value.length < 3) {
                    return 'Recipe name has to be at least 3 characters long';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                onChanged: (cuisine) {
                  this.cuisine = cuisine;
                },
                items: Cuisines.values.map((Cuisines cuisine) {
                  return DropdownMenuItem<Cuisines>(
                      value: cuisine,
                      child: Text(describeEnum(cuisine)));
                }).toList(),
                decoration: const InputDecoration(labelText: 'Cuisine'),
                validator: (value) {
                  if (value == null) {
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
                        controller: _ingNameController,
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
                        controller: _ingQuantityController,
                        keyboardType: TextInputType.number,
                        decoration:
                        const InputDecoration(labelText: 'Quantity'),
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
                    flex: 3,
                    child: DropdownButtonFormField(
                      onChanged: (unit) {
                        this.unit = unit;
                      },
                      items: Unit.values.map((Unit unit) {
                        return DropdownMenuItem<Unit>(
                            value: unit,
                            child: Text(describeEnum(unit)));
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
                    child: IconButton(
                      onPressed: () {
                        // TODO: Add validation
                          setState(() {
                            addIngredient(new Ingredient(name: _ingNameController.text, quantity: double.parse(_ingQuantityController.text), unit: this.unit));
                          });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              ...ingredientItems,
              Divider(),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Steps',
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
                        controller: _stepNameController,
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
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      child: TextFormField(
                        controller: _stepDescriptionController,
                        decoration: const InputDecoration(labelText: 'Description'),
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
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          addStep(new CookStep(name: _stepNameController.text, description: _stepDescriptionController.text));
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              ...stepItems,
              ElevatedButton(
                child: Text('Add new Recipe'),
                onPressed: () {
                  // TODO: Add validation
                  BlocProvider.of<RecipesBloc>(context)
                      .add(
                      RecipeAdded(
                          Recipe(name: _nameController.text, cuisine: this.cuisine, ingredients: this.ingredients, cookSteps: this.steps)
                      )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ingNameController.dispose();
    super.dispose();
  }
}
