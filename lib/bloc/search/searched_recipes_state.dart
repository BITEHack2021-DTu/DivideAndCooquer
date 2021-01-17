import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:equatable/equatable.dart';

abstract class SearchedRecipesState extends Equatable {
  const SearchedRecipesState();

  @override
  List<Object> get props => [];
}

class SearchedRecipesLoadInProgress extends SearchedRecipesState {}

class SearchedRecipesLoadSuccess extends SearchedRecipesState {
  final List<Recipe> filteredRecipes;
  final String query;

  const SearchedRecipesLoadSuccess(
      this.filteredRecipes,
      this.query,
      );

  @override
  List<Object> get props => [filteredRecipes, query];

  @override
  String toString() {
    return 'FilteredRecipesLoadSuccess { filteredRecipes: $filteredRecipes, query: $query }';
  }
}
