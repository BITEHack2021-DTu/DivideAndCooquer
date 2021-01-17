part of 'cook_schedule_bloc.dart';

@immutable
abstract class CookScheduleState extends Equatable {
  const CookScheduleState();

  @override
  List<Object> get props => [];
}

class CookScheduleEmpty extends CookScheduleState {}

class CookScheduleFilled extends CookScheduleState {
  final List<Recipe> recipes;

  CookScheduleFilled([this.recipes = const []]);

  @override
  List<Object> get props => [recipes];
}
