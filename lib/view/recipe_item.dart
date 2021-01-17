import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeItem extends ListTile {
  final Recipe recipe;

  RecipeItem({
    Key key,
    @required this.recipe,
    @required onTap,
    @required onLongPress,
  }) : super(
    key: key,
    title: Text(recipe.name),
    subtitle: Text(recipe.cuisine),
    onTap: onTap,
    onLongPress: onLongPress,
  );
}
