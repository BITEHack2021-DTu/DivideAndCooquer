import 'package:divide_and_cooquer/models/unit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Ingredient extends Equatable {
  final String name;
  final double quantity;
  final Unit unit;

  Ingredient({this.name, this.quantity, this.unit});

  @override
  List<Object> get props => [name];

  @override
  String toString() {
    return name + " " + quantity.toString() + " " + describeEnum(unit);
  }
}
