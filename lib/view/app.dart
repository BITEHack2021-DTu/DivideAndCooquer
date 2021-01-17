import 'package:divide_and_cooquer/bloc/cook_schedule/cook_schedule_bloc.dart';
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:divide_and_cooquer/theme/app_theme.dart';
import 'package:divide_and_cooquer/theme/custom_theme.dart';
import 'package:divide_and_cooquer/view/add_recipe_view.dart';
import 'package:divide_and_cooquer/view/recipe_app.dart';
import 'package:divide_and_cooquer/view/recipe_search_view.dart';
import 'package:divide_and_cooquer/view/recipe_view.dart';
import 'package:divide_and_cooquer/view/step_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  // TODO: Możliwość wyboru motywu (Ciemy/Jasny/Jakiś jeszcze inny?)

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RecipesBloc(RecipeRepository())..add(RecipesLoaded())),
        BlocProvider(create: (context) => CookScheduleBloc(RecipeRepository())..add(CookScheduleCleared())),
      ],
      child: ChangeNotifierProvider(
        // TODO: Czy to ma sens?
        create: (context) => AppTheme(CustomTheme(Colors.amber, Colors.black, Colors.green)),
        child: Consumer<AppTheme>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Divide And Cooquer',
              theme: ThemeData.dark(),
              initialRoute: '/recipe_step',
              routes: {
                '/': (context) => RecipeApp(),
                '/recipe': (context) => RecipeView(),
                '/new_recipe': (context) => AddRecipeView(),
                "/recipe_search": (context) => RecipeSearchView(),
                "/recipe_step": (context) => StepView(),
              },
            );
          },
        ),
      ),
    );
  }
}
