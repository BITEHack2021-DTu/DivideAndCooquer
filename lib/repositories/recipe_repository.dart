import 'dart:convert';
import 'dart:io';

import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class RecipeRepository {
  static const prefix = "recipes";
  List<Recipe> recipes = [];

  RecipeRepository();

  Future<List<Recipe>> loadRecipes() async {

    if(recipes.length > 0) {
      return recipes;
    }

    final documentDir = await _localDir;
    final documentDirPath = documentDir.path;

    final recipesPath = documentDirPath + "/" + prefix;
    var recipesDir = Directory(recipesPath);

    if (!recipesDir.existsSync()) {
      recipesDir = await Directory(recipesPath).create();
    } else {
      final entries = recipesDir.listSync();
      if (entries.length == 0) {
        await _loadRecipesOnline();
      } else {
        await _loadRecipesFromFile(entries);
      }
    }
    return recipes;
  }

  Future<Directory> get _localDir {
    return  getApplicationDocumentsDirectory();
  }

  Future<String> _recipesLocalPath() async {
    final documentDir = await _localDir;
    final documentDirPath = documentDir.path;

    return documentDirPath + "/" + prefix;
}

  Future<void> _loadRecipesFromFile(List<FileSystemEntity> entries) {
    recipes = entries
        .map((FileSystemEntity entry) {
      final rawJSON = File(entry.path).readAsStringSync();

      final json = JsonDecoder().convert(rawJSON);
      return Recipe.fromJSON(json);
    });
  }

  Future<void> addRecipe(Recipe recipe) {
    recipes.add(recipe);
    saveRecipe(recipe);
  }

  Future<void> saveRecipe(Recipe recipe) async {
      final path = await _recipesLocalPath();
      File recipeFile = File(path + recipe.hashCode.toString())..createSync();
      recipeFile.writeAsString(recipe.toJSON());
  }

  Future<void> deleteRecipe(Recipe recipe) {
      recipes.remove(recipe);

  }

  Future<void> _loadRecipesOnline() async {
    const String url = "https://xert.ct8.pl/hackathon";

    final client = http.Client();

    final response = await client.get(url + "/recipes");

    if (response.statusCode == 200) {
      final recipeList = json.decode(response.body);
      final requests = List.of(recipeList)
          .map((recipeName) {
        return client.get(url + "/" + recipeName);
      }).toList();

      Future<List<Response>> responses= Future.wait(requests);
      debugPrint((await responses).toString());
      // todo: check for error
      recipes = (await responses)
          .map((res) {
            debugPrint(res.statusCode.toString());
            final json = JsonDecoder().convert(res.body);
            return Recipe.fromJSON(json);
          })
          .toList();

      recipes.forEach((recipe) {saveRecipe(recipe);});
    } else {
      throw Exception('error fetching posts');
    }
  }
}