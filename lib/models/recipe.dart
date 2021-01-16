import 'package:equatable/equatable.dart';

class Recipe extends Equatable{
  final String name;

  Recipe({this.name});

  @override
  List<Object> get props => [name];
}
