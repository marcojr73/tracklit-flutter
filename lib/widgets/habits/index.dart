import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/index.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsEvent.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsState.dart';
import 'package:tracklit_flutter/widgets/habits/AllHabits.dart';
import 'package:tracklit_flutter/widgets/habits/newHabits.dart';

class Habits extends StatefulWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  State<Habits> createState() => _HabitsState();
}

class _HabitsState extends State<Habits> {
  late final NewHabitBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = NewHabitBloc();
    bloc.add(LoadHabitsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void toggleShowHabits() {
    bloc.add(ToggleHabitsEvent());
  }

  void reload(){
    bloc.add(LoadHabitsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitBloc, HabitsState>(
      bloc: bloc,
      builder: (context, state) {
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              NewHabits(reload: reload,),
              state is LoadHabitsSucessState
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.78,
                      child: AllHabits(
                        allHabits: state.allHabits,
                        reload: reload,
                      ))
                  : state is LoadingHabitsState
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0, vertical: 100),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : state is HabitsEmptyState
                          ? const Text("nenhum hábbito")
                          : Container()
            ]),
          ),
        );
      },
    );
  }
}
