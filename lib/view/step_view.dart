import 'package:divide_and_cooquer/bloc/cooking_process/cooking_process_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CookingProcessBloc>(
      create: (context) => CookingProcessBloc(),
      child: Scaffold(
        body: BlocBuilder<CookingProcessBloc, CookingProcessState>(
          builder: (context, state) {
            if(state is CookingProcessStepState) {
              final step = state.currentStep;
              return Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container()
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              step.name,
                              style: TextStyle(
                                fontSize: 60
                              ),
                            ),
                            Text(
                              step.description,
                              style: TextStyle(
                                  fontSize: 30
                              ),
                            )
                          ],
                        ),
                      ),
                Expanded(
                    flex: 1,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      child: Icon(
                        Icons.chevron_right,
                        size: 100.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ))
              ],
            )
              );
            } else {
              return Container();
            }

          }
        ),
      ),
    );
  }
}