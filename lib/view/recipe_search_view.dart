import 'package:divide_and_cooquer/bloc/cook_schedule/cook_schedule_bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/bloc/search/searched_recipes.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeSearchView extends StatelessWidget {
  Widget _mapRecipeToListEntry(BuildContext context, Recipe recipe) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      child: ListTile(
          title: Text(recipe.name),
          subtitle: Text(recipe.cuisine),
          onTap: () {
            Navigator.of(context)
                .pushNamed("/recipe", arguments: recipe);
          },
          onLongPress: () {
            print('Press long');
            BlocProvider.of<CookScheduleBloc>(context)
                .add(CookScheduleRecipeAdded(recipe));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchedRecipesBloc>(
      create: (context) => SearchedRecipesBloc(recipesBloc: BlocProvider.of<RecipesBloc>(context)),
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
            Builder(
                builder: (context) => TextField(
                      onChanged: (value) {
                        BlocProvider.of<SearchedRecipesBloc>(context)
                            .add(SearchRecipesUpdated(value));
                      },
                    )),
            BlocBuilder<SearchedRecipesBloc, SearchedRecipesState>(
                  builder: (context, state) {
                    if(state is SearchedRecipesLoadSuccess) {
                      final items = (state)
                          .filteredRecipes
                          .map((recipe) => _mapRecipeToListEntry(context, recipe))
                          .toList();
                      return Expanded(
                        child: ListView(
                          children: items,
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}
