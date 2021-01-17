part of 'recipe_checklist_bloc.dart';

abstract class RecipeChecklistState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChecklistEntry {
  Recipe recipe;
  bool state;

  ChecklistEntry(this.recipe, this.state);
}

class RecipesCheckListLoadInProgress extends RecipeChecklistState {}

class RecipeChecklistCheckState extends RecipeChecklistState {
  final List<ChecklistEntry> recipesChecklist;

  @override
  List<Object> get props => [recipesChecklist];

  RecipeChecklistCheckState(this.recipesChecklist);
}
