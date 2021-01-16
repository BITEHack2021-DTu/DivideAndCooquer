import 'package:divide_and_cooquer/models/recipe.dart';

class RecipeRepository {
  List<Recipe> recipes;

  RecipeRepository() {
    recipes
      ..add(Recipe(name:"Schabowe"))
      ..add(Recipe(name:"Mielone"));
  }

  Future<List<Recipe>> loadRecipes() async {
    return recipes;
  }

  Future<void> saveRecipe(Recipe recipe) {
      recipes.add(recipe);
  }

  Future<void> deleteRecipe(String name) {

  }
}