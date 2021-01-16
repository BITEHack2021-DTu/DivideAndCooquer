part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesLoadInProgress extends RecipesState {}

class RecipesLoadSuccess extends RecipesState {
  final List<Recipe> recipes;

  RecipesLoadSuccess([this.recipes = const []]);

  @override
  List<Object> get props => [recipes];

}

class RecipesLoadFailure extends RecipesState {}
