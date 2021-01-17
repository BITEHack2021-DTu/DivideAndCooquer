part of 'cook_schedule_bloc.dart';

@immutable
abstract class CookScheduleState extends Equatable {
  const CookScheduleState();

  @override
  List<Object> get props => [];
}

class CookScheduleLoadInProgress extends CookScheduleState {}

class CookScheduleLoadSuccess extends CookScheduleState {
  final List<Recipe> recipes;

  CookScheduleLoadSuccess([this.recipes = const []]);

  @override
  List<Object> get props => [recipes];
}

class CookScheduleLoadFailure extends CookScheduleState {}
