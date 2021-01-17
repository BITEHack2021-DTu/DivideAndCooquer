import 'package:divide_and_cooquer/bloc/search/searched_recipes_bloc.dart';
import 'package:divide_and_cooquer/bloc/search/searched_recipes_event.dart';
import 'package:divide_and_cooquer/bloc/search/searched_recipes_state.dart';
import 'package:divide_and_cooquer/models/visibility_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  final bool visible;

  FilterButton({this.visible, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.bodyText2;
    final activeStyle = Theme.of(context)
        .textTheme
        .bodyText2
        .copyWith(color: Theme.of(context).accentColor);
    return BlocBuilder<SearchedRecipesBloc, SearchedRecipesState>(
        builder: (context, state) {
          final button = _Button(
            onSelected: (filter) {
              BlocProvider.of<SearchedRecipesBloc>(context).add(SearchUpdated(filter));
            },
            activeFilter: state is SearchedRecipesLoadSuccess
                ? state.activeFilter
                : VisibilityFilter.all,
            activeStyle: activeStyle,
            defaultStyle: defaultStyle,
          );
          return AnimatedOpacity(
            opacity: visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 150),
            child: visible ? button : IgnorePointer(child: button),
          );
        });
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VisibilityFilter>(
      //TODO implement finding by name and cuisine

      icon: Icon(Icons.filter_list),
    );
  }
}