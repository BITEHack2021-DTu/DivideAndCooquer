import 'dart:convert';

import 'package:divide_and_cooquer/models/cuisines.dart';
import 'package:divide_and_cooquer/models/unit.dart';
import 'package:equatable/equatable.dart';

import '../utils.dart';
import 'cook_step.dart';
import 'ingredient.dart';

class Recipe extends Equatable{
  final String name;
  final Cuisines cuisine;
  final List<Ingredient> ingredients;
  final List<CookStep> cookSteps;

  Recipe({this.name, this.cuisine, this.ingredients, this.cookSteps});

  Recipe.fromJSON(json)
  : ingredients  = _loadIngredients(json),
    cookSteps = _loadCookSteps(json),
    name = json["name"],
    cuisine = stringToEnum(Cuisines.values, json["cuisine"]);

  static List<CookStep> _loadCookSteps(json) {
    return List.of(json["step"])
        .map((rawStep) => CookStep(name: rawStep["name"]))
        .toList();
  }

  static List<Ingredient> _loadIngredients(json) {
    return List.of(json["ingredients"])
        .map((rawIngredient) => Ingredient(
            name: rawIngredient["name"],
            quantity: rawIngredient["quantity"],
            unit: stringToEnum(Unit.values, rawIngredient["unit"])))
        .toList();
  }

  String toJSON() {
    final recipeObj = {
      "name": name,
      "cuisine": cuisine,
      "step": cookSteps.map((cookStep) => {
        name: cookStep.name
      }).toList(),
      "ingredients": ingredients
          .map((ingredient) => {
            name: ingredient.name
      }).toList(),
    };
    return JsonEncoder().convert(recipeObj);
  }

  @override
  List<Object> get props => [name];
}
