import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_theme.dart';

class AppTheme extends ChangeNotifier {
  CustomTheme theme;

  AppTheme(this.theme);

  Color get appBar => theme.appBar;
  Color get background => theme.background;
  Color get listItem => theme.listItem;

  void setTheme(CustomTheme theme) {
    this.theme = theme;
    notifyListeners();
  }
}