import 'package:divide_and_cooquer/theme/app_theme.dart';
import 'package:divide_and_cooquer/theme/custom_theme.dart';
import 'package:divide_and_cooquer/view/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'JsonPage.dart';

void main() => runApp(App());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => AppTheme(CustomTheme(Colors.amber, Colors.black)),
        builder: (context, child) {
          return Consumer<AppTheme>(
            builder: (context, value, child) {
              return MaterialApp(
                title: 'Divide And Cooquer',
                theme: ThemeData(
                  primarySwatch: Colors.green,
                ),
                home: JsonPage(),
              );
            },
          );
        });
  }
}
