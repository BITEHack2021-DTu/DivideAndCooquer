import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final String name;

  Ingredient({this.name});

  @override
  List<Object> get props => [name];
}
