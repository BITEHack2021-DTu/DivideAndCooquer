import 'package:divide_and_cooquer/view/search_view.dart';
import 'package:flutter/material.dart';

class TopBar extends AppBar {
  TopBar(addCallback) : super(
      title: const Text('Divide and Cooquer'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Add recipe',
          onPressed: addCallback,
        ),
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'filter',
          onPressed: () {
            SearchView searchView = SearchView();
            searchView.createState();
            // TODO: Implement action
          },
        )
      ]);
}