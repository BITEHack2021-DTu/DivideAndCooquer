import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/models/visibility_filter.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredRecipesState extends Equatable {
  const FilteredRecipesState();

  @override
  List<Object> get props => [];
}

class FilteredRecipesLoadInProgress extends FilteredRecipesState {}

class FilteredRecipesLoadSuccess extends FilteredRecipesState {
  final List<Recipe> filteredRecipes;
  final VisibilityFilter activeFilter;

  const FilteredRecipesLoadSuccess(
      this.filteredRecipes,
      this.activeFilter,
      );

  @override
  List<Object> get props => [filteredRecipes, activeFilter];

  @override
  String toString() {
    return 'FilteredRecipesLoadSuccess { filteredRecipes: $filteredRecipes, activeFilter: $activeFilter }';
  }
}
