import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/models/visibility_filter.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredRecipesEvent extends Equatable {
  const FilteredRecipesEvent();
}

class FilterUpdated extends FilteredRecipesEvent {
  final VisibilityFilter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'FilterUpdated { filter: $filter }';
}

class RecipesUpdated extends FilteredRecipesEvent {
  final List<Recipe> recipes;

  const RecipesUpdated(this.recipes);

  @override
  List<Object> get props => [recipes];

  @override
  String toString() => 'RecipesUpdated { recipes: $recipes }';
}