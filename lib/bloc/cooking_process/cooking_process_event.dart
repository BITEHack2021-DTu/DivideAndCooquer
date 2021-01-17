part of 'cooking_process_bloc.dart';

abstract class CookingProcessEvent extends Equatable {
  const CookingProcessEvent();

  @override
  List<Object> get props => [];
}

class CookingStepNextPushed extends CookingProcessEvent {}
