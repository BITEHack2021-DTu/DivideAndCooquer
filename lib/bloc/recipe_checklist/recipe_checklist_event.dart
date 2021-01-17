part of 'recipe_checklist_bloc.dart';

abstract class RecipeChecklistEvent extends Equatable {
  const RecipeChecklistEvent();

  @override
  List<Object> get props => [];
}

class RecipeChecklistCheckUpdateEvent extends RecipeChecklistEvent {
  final List<Recipe> recipes;

  RecipeChecklistCheckUpdateEvent(this.recipes);
}

class RecipeChecklistUpdate extends RecipeChecklistEvent {
  final List<Recipe> recipes;

  RecipeChecklistUpdate(this.recipes);
}


