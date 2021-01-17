import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cook_schedule_event.dart';
part 'cook_schedule_state.dart';

// TODO: Check it out later

class CookScheduleBloc extends Bloc<CookScheduleEvent, CookScheduleState> {
  //final List<Recipe> recipes = [];

  CookScheduleBloc(RecipeRepository recipeRepository) : super(CookScheduleLoadInProgress());

  @override
  Stream<CookScheduleState> mapEventToState(CookScheduleEvent event) async* {
    if(event is CookScheduleLoaded) {
      yield* _mapCookScheduleLoadedToState();
    } else if (event is CookScheduleAdded) {
      yield* _mapCookScheduleAddedToState(event);
    }
  }

  Stream<CookScheduleState> _mapCookScheduleLoadedToState() async* {
    yield CookScheduleLoadSuccess([]);
  }

  Stream<CookScheduleState> _mapCookScheduleAddedToState(CookScheduleAdded event) async* {
    if(state is CookScheduleLoadSuccess) {
      final List<Recipe> updatedCookSchedule = (state as CookScheduleLoadSuccess).recipes
          ..add(event.recipe);

      print(updatedCookSchedule);

      yield CookScheduleLoadSuccess(updatedCookSchedule);
    }
  }

  Stream<CookScheduleState> _mapCookScheduleDeletedFromState(CookScheduleDeleted event) async* {
    if (state is CookScheduleLoadSuccess) {
      final List<Recipe> updatedCookSchedule = (state as CookScheduleLoadSuccess)
          .recipes
          .where((recipe) => recipe.name != event.recipe.name)
          .toList();
      yield CookScheduleLoadSuccess(updatedCookSchedule);
    }
  }

  /*void addRecipe(Recipe recipe) {
    this.recipes.add(recipe);
  }

  void removeRecipe(Recipe recipe) {
    this.recipes.remove(recipe);
  }*/
}
