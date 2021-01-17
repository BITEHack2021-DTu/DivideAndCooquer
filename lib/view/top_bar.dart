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
            // TODO: Implement action
          },
        )
      ]);
}