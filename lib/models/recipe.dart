import 'package:equatable/equatable.dart';
import 'ingredient.dart';
import 'cook_step.dart';

class Recipe extends Equatable{
  final String name;
  final String cuisine;
  final List<Ingredient> ingredients;
  final List<CookStep> cookSteps;

  Recipe({this.name, this.cuisine, this.ingredients, this.cookSteps});

  @override
  List<Object> get props => [name];
}
