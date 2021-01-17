part of 'cook_schedule_bloc.dart';

abstract class CookScheduleEvent extends Equatable {
  const CookScheduleEvent();

  @override
  List<Object> get props => [];
}

class CookScheduleCleared extends CookScheduleEvent {}

class CookScheduleRecipeAdded extends CookScheduleEvent {
  final Recipe recipe;

  const CookScheduleRecipeAdded(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class CookScheduleRecipeDeleted extends CookScheduleEvent {
  final Recipe recipe;

  const CookScheduleRecipeDeleted(this.recipe);

  @override
  List<Object> get props => [recipe];
}
