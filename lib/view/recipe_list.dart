import 'package:divide_and_cooquer/bloc/cook_schedule/cook_schedule_bloc.dart';
import 'package:divide_and_cooquer/bloc/recipe_checklist/recipe_checklist_bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeList extends StatelessWidget {
  RecipeList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeChecklistBloc, RecipeChecklistState>(builder: (context, state) {
      if (state is RecipesLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is RecipeChecklistCheckState) {
        final entries = state.recipesChecklist;
        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            final entry = entries[index];
            return Container(
              key: Key(entry.recipe.name),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26)),
              ),
              child: ListTile(
                  trailing: entry.state ? Icon(Icons.check) : null,
                  title: Text(entry.recipe.name),
                  subtitle: Text(describeEnum(entry.recipe.cuisine)),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("/recipe", arguments: entry.recipe);
                  },
                  onLongPress: () {
                    // TODO: Implement adding to TO-COOK list
                    print('Press long');
                    if(entry.state) {
                      BlocProvider.of<CookScheduleBloc>(context)
                          .add(CookScheduleRecipeDeleted(entry.recipe));
                    } else {
                      BlocProvider.of<CookScheduleBloc>(context)
                          .add(CookScheduleRecipeAdded(entry.recipe));
                    }

                  }),
            );
          },
        );
      } else {
        return Container();
      }
    });
  }
}
