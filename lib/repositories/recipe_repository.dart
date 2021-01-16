import 'dart:convert';
import 'dart:io';

import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:path_provider/path_provider.dart';

class RecipeRepository {
  List<Recipe> recipes = [];

  RecipeRepository();

  Future<List<Recipe>> loadRecipes() async {
    final myDir = new Directory(_localPath.toString());
    if(myDir.listSync().length == 0) {
      readRecipesOnline();
    }
    List<Recipe> recipeList;
    myDir.list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {

      recipeList.addAll(createRecipiesFromFile(entity.path));
    });

    return recipeList;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  List<Recipe> createRecipiesFromFile(String path) {
    final string = File(path).readAsStringSync();
    final json = JsonDecoder().convert(string);
    final List<Recipe> recipesList = (json)
        .map((recipe) => Recipe(name:recipe["name"]))
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