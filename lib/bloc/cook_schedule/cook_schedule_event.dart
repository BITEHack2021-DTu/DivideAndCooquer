part of 'cook_schedule_bloc.dart';

abstract class CookScheduleEvent extends Equatable {
  const CookScheduleEvent();

  @override
  List<Object> get props => [];
}

class CookScheduleLoaded extends CookScheduleEvent {}

class CookScheduleAdded extends CookScheduleEvent {
  final Recipe recipe;

  const CookScheduleAdded(this.recipe);

  @override
  List<Object> get props => [recipe];
}

class CookScheduleDeleted extends CookScheduleEvent {
  final Recipe recipe;

  const CookScheduleDeleted(this.recipe);

  @override
  List<Object> get props => [recipe];
}
