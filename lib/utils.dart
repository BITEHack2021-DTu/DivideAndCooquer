T stringToEnum<T>(Iterable<T> enumValues, String string) {
  return enumValues.firstWhere((type) => type.toString().split(".").last == string,
      orElse: () => null);
}