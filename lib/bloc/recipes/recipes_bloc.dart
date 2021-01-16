import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeRepository recipeRepository;

  RecipesBloc(@required this.recipeRepository) : super(RecipesLoadInProgress());

  @override
  Stream<RecipesState> mapEventToState(
    RecipesEvent event,
  ) async* {
    if(event is RecipesLoaded) {
      yield* _mapRecipeLoadedToState();
    } else if (event is RecipeAdded) {
      yield* _mapRecipeAddedToState(event);
    }
    // TODO: implement mapEventToState
  }

  Stream<RecipesState> _mapRecipeLoadedToState() async* {
    try {
      final recipes = await this.recipeRepository.loadRecipes();
      yield RecipesLoadSuccess(
        recipes
      );
    } catch (_) {
      yield RecipesLoadFailure();
    }
  }

  Stream<RecipesState> _mapRecipeAddedToState(RecipeAdded event) async* {
    if (state is RecipesLoadSuccess) {
      final List<Recipe> updatedRecipes = (state as RecipesLoadSuccess).recipes
        ..add(event.recipe);
      yield RecipesLoadSuccess(updatedRecipes);
    }
  }

  Stream<RecipesState> _mapRecipeDeletedFromState(RecipeDeleted event) async* {
    if (state is RecipesLoadSuccess) {
      final List<Recipe> updatedRecipes = (state as RecipesLoadSuccess)
          .recipes
          .where((recipe) => recipe.name != event.recipe.name)
          .toList();
      yield RecipesLoadSuccess(updatedRecipes);
    }
  }
}
