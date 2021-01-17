import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:divide_and_cooquer/repositories/recipe_repository.dart';
import 'package:divide_and_cooquer/theme/app_theme.dart';
import 'package:divide_and_cooquer/theme/custom_theme.dart';
import 'package:divide_and_cooquer/view/recipe_app.dart';
import 'package:divide_and_cooquer/view/recipe_list.dart';
import 'package:divide_and_cooquer/view/recipe_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesBloc(RecipeRepository())..add(RecipesLoaded()),
      child: ChangeNotifierProvider(
        create: (context) => AppTheme(CustomTheme(Colors.amber, Colors.black)),
        child: Consumer<AppTheme>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Divide And Cooquer',
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => RecipeApp(),
                '/recipe': (context) => RecipeView()
              },
            );
          },
        ),
      ),
    );
  }
}
