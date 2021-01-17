import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class CustomTheme extends ChangeNotifier {
  Color appBar;
  Color background;
  Color listItem;

  CustomTheme(this.appBar, this.background, this.listItem);
}