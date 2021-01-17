import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:equatable/equatable.dart';

abstract class SearchedRecipesEvent extends Equatable {
  const SearchedRecipesEvent();
}

class SearchRecipesUpdated extends SearchedRecipesEvent {
  final String query;

  const SearchRecipesUpdated(this.query);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'FilterUpdated { query: $query }';
}

class RecipesUpdated extends SearchedRecipesEvent {
  final List<Recipe> recipes;

  const RecipesUpdated(this.recipes);

  @override
  List<Object> get props => [recipes];

  @override
  String toString() => 'RecipesUpdated { recipes: $recipes }';
}