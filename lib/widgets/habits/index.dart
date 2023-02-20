import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/index.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsEvent.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsState.dart';
import 'package:tracklit_flutter/widgets/habits/AllHabits.dart';
import 'package:tracklit_flutter/widgets/habits/newHabit.dart';
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
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void toggleShowHabits() {
    bloc.add(ToggleHabitsEvent());
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
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "Meus hábitos",
              //           style: TextStyle(
              //               color: Theme.of(context).colorScheme.primary,
              //               fontSize: 30),
              //         ),
              //         Container(
              //             alignment: Alignment.center,
              //             width: 40,
              //             height: 40,
              //             decoration: BoxDecoration(
              //                 borderRadius:
              //                     const BorderRadius.all(Radius.circular(5)),
              //                 color: Theme.of(context).colorScheme.secondary),
              //             child: IconButton(
              //               icon: const Icon(
              //                 Icons.add,
              //                 color: Colors.white,
              //               ),
              //               onPressed: () {
              //                 toggleShowHabits();
              //               },
              //             ))
              //       ]),
              // ),
              const NewHabits(),
              const SizedBox(height: 500, child: AllHabits())
            ]),
          ),
        );
      },
    );
  }
}
