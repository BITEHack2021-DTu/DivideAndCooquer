import 'package:equatable/equatable.dart';

class CookStep extends Equatable {
  final String name;

  CookStep({this.name});

  @override
  List<Object> get props => [name];
}
