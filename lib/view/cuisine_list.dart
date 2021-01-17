
import 'package:divide_and_cooquer/bloc/recipes/recipes_bloc.dart';
import 'package:flutter/material.dart';

// TODO: Adjust to cuisines providers that don't exist yet
/*
class CuisineList extends StatelessWidget {
  CuisineList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CuisinesBloc, CuisinesState>(
        builder: (context, state) {
          if(state is RecipesLoadInProgress) {
            return CircularProgressIndicator();
          } else if (state is RecipesLoadSuccess) {
            final cuisines = state.cuisines;
            return ListView.builder(
                itemCount: cuisines.length,
                itemBuilder: (BuildContext context, int index) {
                  final cuisines = cuisines[index];
                  return ListTile(
                      title: Text(recipe.name),
                      onTap: () {
                        print('Not yet implemented');
                      }
                  );
                }
            );
          } else {
            return Container();
          }
        }
    );
  }
}
*/
