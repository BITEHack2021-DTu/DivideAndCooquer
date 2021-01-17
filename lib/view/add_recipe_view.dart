import 'package:divide_and_cooquer/models/cuisines.dart';
import 'package:divide_and_cooquer/models/unit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddRecipeView extends StatelessWidget {
  AddRecipeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value.length < 3) {
                  return 'Recipe name has to be at least 3 characters long';
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              onChanged: (cuisine) {},
              items: Cuisines.values.map((Cuisines cuisine) {
                return DropdownMenuItem<Cuisines>(
                    value: cuisine, child: Text(cuisine.toString()));
              }).toList(),
              decoration: const InputDecoration(labelText: 'Cuisine'),
              validator: (value) {
                if (!value) {
                  return 'Please specify the cuisine';
                }
                return null;
              },
            ),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Ingredients',
                    style: TextStyle(fontSize: 18),
                  ),
                )
            ),
            /*Row(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please specify quantity of the ingredient';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                  items: Unit.values.map((Unit unit) {
                    return DropdownMenuItem<Unit>(
                        value: unit, child: Text(unit.toString()));
                  }).toList(),
                  decoration: const InputDecoration(labelText: 'Unit'),
                  hint: Text('Unit'),
                  validator: (value) {
                    if (!value) {
                      return 'Please specify the unit';
                    }
                    return null;
                  },
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
