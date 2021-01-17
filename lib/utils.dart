import 'package:flutter/foundation.dart';

T stringToEnum<T>(Iterable<T> enumValues, String string) {
  return enumValues.firstWhere((type) => type.toString().split(".").last == string,
      orElse: () {
          debugPrint(string);
          return null;
      });
}