import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:divide_and_cooquer/models/cuisines.dart';
import 'package:divide_and_cooquer/models/ingredient.dart';
import 'package:divide_and_cooquer/models/unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  final _formKey = GlobalKey<FormState>();
  final _ingredientKey = GlobalKey<FormState>();
  final _stepKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

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
                        controller: _controller,
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
                    flex: 2,
                    child: DropdownButtonFormField(
                      onChanged: (unit) {},
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
                            addIngredient(new Ingredient(name: _controller.text, quantity: 50.0, unit: Unit.ml));
                          });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              ...ingredientItems,
              Divider(),
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
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          addStep(new CookStep(name: 'TmpStep'));
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
                  // TODO: Implement adding recipe to Bloc
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
    _controller.dispose();
    super.dispose();
  }
}
