part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipesLoaded extends RecipesEvent {}

class RecipeAdded extends RecipesEvent {
  final Recipe recipe;
  
  const RecipeAdded(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class RecipeDeleted extends RecipesEvent {
  final Recipe recipe;

  const RecipeDeleted(this.recipe);

  @override
  List<Object> get props => [recipe];
}
