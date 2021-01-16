import 'package:flutter/material.dart';

import 'JsonPage.dart';

void main() => runApp(MyApp());

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