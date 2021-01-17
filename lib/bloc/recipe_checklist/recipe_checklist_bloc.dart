import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/bloc/cook_schedule/cook_schedule_bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'recipe_checklist_event.dart';
part 'recipe_checklist_state.dart';

class RecipeChecklistBloc extends Bloc<RecipeChecklistEvent, RecipeChecklistState> {
  CookScheduleBloc cookScheduleBloc;
  RecipesBloc recipesBloc;
  RecipeChecklistBloc(
      this.cookScheduleBloc,
      this.recipesBloc
      ) : super(RecipesCheckListLoadInProgress()) {
    recipesBloc.listen((st) {
      if(st is RecipesLoadSuccess) {
          add(RecipeChecklistUpdate(st.recipes));
      }
    });

    cookScheduleBloc.listen((st) {
      debugPrint("Schedule changed");
      if(st is CookScheduleFilled) {
          add(RecipeChecklistCheckUpdateEvent(st.recipes));
      } else {
        add(RecipeChecklistCheckUpdateEvent([]));
      }
    });
  }

  @override
  Stream<RecipeChecklistState> mapEventToState(
    RecipeChecklistEvent event,
  ) async* {
    if (event is RecipeChecklistUpdate) {
      yield* _mapRecipeChecklistUpdate(event);
    } else if (event is RecipeChecklistCheckUpdateEvent) {
      yield* _mapRecipeChecklistUpdateCheck(event);
    }
  }

  Stream<RecipeChecklistState> _mapRecipeChecklistUpdate(RecipeChecklistUpdate event) async* {
    yield RecipeChecklistCheckState(event.recipes.map((recipe) => ChecklistEntry(recipe, false)).toList());
  }

  Stream<RecipeChecklistState> _mapRecipeChecklistUpdateCheck(RecipeChecklistCheckUpdateEvent event) async* {
    List<ChecklistEntry> entries = (state as RecipeChecklistCheckState)
        .recipesChecklist;
    entries.forEach((entry) => entry.state = false);
    debugPrint(entries.map((element) => element.state).toList().toString());
    entries.forEach((element) {debugPrint(element.state.toString());});
    event.recipes.forEach((recipe) {
      entries.firstWhere((entry) => entry.recipe == recipe).state = true;
    });
    debugPrint(entries.map((element) => element.state).toList().toString());

    yield RecipeChecklistCheckState(entries);
  }

}
