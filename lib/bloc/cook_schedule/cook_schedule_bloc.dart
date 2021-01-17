import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'cook_schedule_event.dart';
part 'cook_schedule_state.dart';

class CookScheduleBloc extends Bloc<CookScheduleEvent, CookScheduleState> {

  CookScheduleBloc(RecipeRepository recipeRepository) : super(CookScheduleEmpty());

  @override
  Stream<CookScheduleState> mapEventToState(CookScheduleEvent event) async* {
    if(event is CookScheduleCleared) {
      yield* _mapCookScheduleCleared();
    } else if (event is CookScheduleRecipeAdded) {
      yield* _mapCookScheduleAddedToState(event);
    } else if (event is CookScheduleRecipeDeleted) {
      yield* _mapCookScheduleDeletedFromState(event);
    }
  }

  Stream<CookScheduleState> _mapCookScheduleCleared() async* {
    yield CookScheduleEmpty();
  }

  Stream<CookScheduleState> _mapCookScheduleAddedToState(CookScheduleRecipeAdded event) async* {
    if(state is CookScheduleFilled) {
      final List<Recipe> updatedCookSchedule = (state as CookScheduleFilled).recipes
          ..add(event.recipe);
      yield CookScheduleFilled(updatedCookSchedule);
    } else {
      yield CookScheduleFilled([event.recipe]);
    }
  }

  Stream<CookScheduleState> _mapCookScheduleDeletedFromState(CookScheduleRecipeDeleted event) async* {
    if (state is CookScheduleFilled) {
      final List<Recipe> updatedCookSchedule = (state as CookScheduleFilled)
          .recipes
          .where((recipe) => recipe.name != event.recipe.name)
          .toList();
      if(updatedCookSchedule.isEmpty) {
        yield CookScheduleEmpty();
      } else {
        yield CookScheduleFilled(updatedCookSchedule);
      }
    }
  }
}
