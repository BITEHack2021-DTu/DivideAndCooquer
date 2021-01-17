import 'dart:async';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/bloc/search/filtered_recipes_state.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:divide_and_cooquer/models/visibility_filter.dart';
import 'package:meta/meta.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filtered_recipes_event.dart';

class FilteredRecipesBloc extends Bloc<FilteredRecipesEvent, FilteredRecipesState> {
  final RecipesBloc recipesBloc;
  StreamSubscription recipesSubscription;

  FilteredRecipesBloc({@required this.recipesBloc})
      : super(
    recipesBloc.state is RecipesLoadSuccess
        ? FilteredRecipesLoadSuccess(
      (recipesBloc.state as RecipesLoadSuccess).recipes,
      VisibilityFilter.all,
    )
        : FilteredRecipesLoadInProgress(),
  ) {
    recipesSubscription = recipesBloc.listen((state) {
      if (state is RecipesLoadSuccess) {
        add(RecipesUpdated((recipesBloc.state as RecipesLoadSuccess).recipes));
      }
    });
  }

  @override
  Stream<FilteredRecipesState> mapEventToState(FilteredRecipesEvent event) async* {
    if (event is FilterUpdated) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is RecipesUpdated) {
      yield* _mapRecipesUpdatedToState(event);
    }
  }

  Stream<FilteredRecipesState> _mapUpdateFilterToState(
      FilterUpdated event,
      ) async* {
    if (recipesBloc.state is RecipesLoadSuccess) {
      yield FilteredRecipesLoadSuccess(
        _mapRecipesToFilteredRecipes(
          (recipesBloc.state as RecipesLoadSuccess).recipes,
          event.filter,
        ),
        event.filter,
      );
    }
  }

  Stream<FilteredRecipesState> _mapRecipesUpdatedToState(
      RecipesUpdated event,
      ) async* {
    final visibilityFilter = state is FilteredRecipesLoadSuccess
        ? (state as FilteredRecipesLoadSuccess).activeFilter
        : VisibilityFilter.all;
    yield FilteredRecipesLoadSuccess(
      _mapRecipesToFilteredRecipes(
        (recipesBloc.state as RecipesLoadSuccess).recipes,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<Recipe> _mapRecipesToFilteredRecipes(List<Recipe> recipes, VisibilityFilter filter) {
  //   return recipes.where((recipe) {
  //     if (filter == VisibilityFilter.all) {
  //       return true;
  //     } else if (filter == VisibilityFilter.name) {
  //       TODO wyszukiwanie po nazwie
  //       return recipe.name;
  //     } else if (filter == VisibilityFilter.cuisine{
  //       // return recipe.cuisine;
  //     }
  //   }).toList();
  }

  @override
  Future<void> close() {
    recipesSubscription.cancel();
    return super.close();
  }
}