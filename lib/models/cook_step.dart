import 'package:equatable/equatable.dart';

class CookStep extends Equatable {
  final String name;

  final String description;

  CookStep({this.name, this.description});

  @override
  List<Object> get props => [name];

  @override
  String toString() {
    return name + " " + description;
  }
}
