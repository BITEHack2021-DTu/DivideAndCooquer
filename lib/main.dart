import 'package:divide_and_cooquer/view/app.dart';
import 'package:flutter/material.dart';

import 'JsonPage.dart';

void main() => runApp(App());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divide And Cooquer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: JsonPage(),
    );
  }
}