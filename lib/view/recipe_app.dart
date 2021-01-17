

import 'package:divide_and_cooquer/bloc/cook_schedule/cook_schedule_bloc.dart';
import 'package:divide_and_cooquer/view/recipe_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'top_bar.dart';


class RecipeApp extends StatelessWidget {

  RecipeApp({Key key, bool recipeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookScheduleBloc, CookScheduleState>(
      builder: (context, state) {
        Widget startButton = null;
        if(state is CookScheduleFilled) {
          debugPrint("Here");
          startButton = FloatingActionButton(
            child: Text("Start"),
          );
        }

      return Scaffold(
        appBar: TopBar(
          () {
            Navigator.of(context).pushNamed("/new_recipe");
          },
          () {
            Navigator.of(context).pushNamed("/recipe_search");
          },
        ),
        floatingActionButton: startButton,
          body: Center(
            child: RecipeList(),
          ),
          backgroundColor: Theme
              .of(context)
              .backgroundColor,
        );
      }
    );
  }
}