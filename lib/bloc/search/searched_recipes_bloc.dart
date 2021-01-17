import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/bloc/search/searched_recipes_state.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:string_similarity/string_similarity.dart';

import 'searched_recipes_event.dart';

class SearchedRecipesBloc extends Bloc<SearchedRecipesEvent, SearchedRecipesState> {
  final RecipesBloc recipesBloc;
  StreamSubscription recipesSubscription;

  SearchedRecipesBloc({@required this.recipesBloc})
      : super(
          recipesBloc.state is RecipesLoadSuccess
              ? SearchedRecipesLoadSuccess(
                  (recipesBloc.state as RecipesLoadSuccess).recipes, null)
              : SearchedRecipesLoadInProgress(),
        ) {
    recipesSubscription = recipesBloc.listen((state) {
      if (state is RecipesLoadSuccess) {
        add(RecipesUpdated((recipesBloc.state as RecipesLoadSuccess).recipes));
      }
    });
  }

  @override
  Stream<SearchedRecipesState> mapEventToState(SearchedRecipesEvent event) async* {
    if (event is SearchRecipesUpdated) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is RecipesUpdated) {
      yield* _mapRecipesUpdatedToState(event);
    }
  }

  Stream<SearchedRecipesState> _mapUpdateFilterToState(
      SearchRecipesUpdated event,
      ) async* {
    if (recipesBloc.state is RecipesLoadSuccess) {
      yield SearchedRecipesLoadSuccess(
        _mapRecipesToFilteredRecipes(
          (recipesBloc.state as RecipesLoadSuccess).recipes,
          event.query,
        ),
        event.query,
      );
    }
  }

  Stream<SearchedRecipesState> _mapRecipesUpdatedToState(
    RecipesUpdated event,
  ) async* {
    String query;
    if(state is SearchedRecipesLoadSuccess) {
      query = (state as SearchedRecipesLoadSuccess).query;
    }
    yield SearchedRecipesLoadSuccess(
      _mapRecipesToFilteredRecipes(
        (recipesBloc.state as RecipesLoadSuccess).recipes,
        query,
      ),
      query,
    );
  }

  List<Recipe> _mapRecipesToFilteredRecipes(List<Recipe> recipes, String query) {
    if(query != null) {
      return recipes.where((recipe) {
        return StringSimilarity.compareTwoStrings(recipe.name, query) > 0.3
        || recipe.name.toUpperCase().startsWith(query.toUpperCase())
        || StringSimilarity.compareTwoStrings(describeEnum(recipe.cuisine), query) > 0.3;
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> close() {
    recipesSubscription.cancel();
    return super.close();
  }
}