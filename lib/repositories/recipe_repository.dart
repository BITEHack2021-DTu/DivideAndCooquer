import 'dart:convert';
import 'dart:io';

import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:divide_and_cooquer/models/ingredient.dart';
import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:path_provider/path_provider.dart';

class RecipeRepository {
  List<Recipe> recipes = [];

  RecipeRepository();

  Future<List<Recipe>> loadRecipes() async {
    var myDir = Directory((await _localPath).toString());

    if(!myDir.existsSync()) {
      myDir = new Directory('recipes').create() as Directory;
    }

    if(myDir.listSync().length == 0) {
      readRecipesOnline();
    }
    List<Recipe> recipeList;
    myDir.list(recursive: false, followLinks: false)
        .listen((FileSystemEntity entity) {

      recipeList.addAll(createRecipesFromFile(entity.path));
    });

    return recipeList;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  List<Recipe> createRecipesFromFile(String path) {
    List<Ingredient> ingredientList;
    List<CookStep> stepList;
    final string = File(path).readAsStringSync();
    final json = JsonDecoder().convert(string);
    final List<Recipe> recipesList = (json)
        .map((recipe) {
          recipe["ingredients"].forEach((ingredient) {
            Ingredient smallIngredient = Ingredient(name: ingredient["name"]);
            ingredientList.add(smallIngredient);
          });

          recipe["step"].forEach((step) {
            final CookStep cookStep = CookStep(name: step["name"]);
            stepList.add(cookStep);
          });

          return Recipe(name: recipe["name"], cuisine: recipe["cuisine"], ingredients: ingredientList, cookSteps: stepList);
        })
        .toList();
    recipesList.forEach((element) {saveRecipe(element);});
    return recipesList;
  }

  Future<void> saveRecipe(Recipe recipe) {
      recipes.add(recipe);
  }

  Future<void> deleteRecipe(Recipe recipe) {
    recipes.remove(recipe);

  }

  void readRecipesOnline() {

  }

}