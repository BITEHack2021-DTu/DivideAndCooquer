import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:divide_and_cooquer/models/cook_step.dart';
import 'package:equatable/equatable.dart';

part 'cooking_process_event.dart';
part 'cooking_process_state.dart';

class CookingProcessBloc extends Bloc<CookingProcessEvent, CookingProcessState> {
  CookingProcessBloc() : super(CookingProcessStepState(CookStep(name: "test")));

  @override
  Stream<CookingProcessState> mapEventToState(
    CookingProcessEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
