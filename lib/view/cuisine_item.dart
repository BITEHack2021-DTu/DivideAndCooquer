

import 'package:divide_and_cooquer/models/recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeItem extends ListTile {
  final Recipe recipe;

  RecipeItem({
    Key key,
    @required this.recipe,
  }) : super(
      key: key,
      title: Text(recipe.name),
      onTap: () {
        print('Not yet implemented');
      }
  );
}
