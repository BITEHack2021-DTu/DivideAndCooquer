import 'dart:ui';

import 'package:flutter/foundation.dart';

@immutable
class CustomTheme extends ChangeNotifier {
  Color appBar;
  Color background;

  CustomTheme(this.appBar, this.background);
}