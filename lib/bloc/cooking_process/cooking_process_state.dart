part of 'cooking_process_bloc.dart';

abstract class CookingProcessState extends Equatable {
  const CookingProcessState();
}

class CookingProcessStepState extends CookingProcessState {
  final CookStep currentStep;
  //todo: timed tasks

  CookingProcessStepState(this.currentStep);

  @override
  List<Object> get props => [currentStep];
}
