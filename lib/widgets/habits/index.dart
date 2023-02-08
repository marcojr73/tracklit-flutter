import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';
import 'package:tracklit_flutter/widgets/habits/newHabit.dart';

class Habits extends StatelessWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HabitsBloc, bool>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meus hábitos",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 30),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            color: Theme.of(context).colorScheme.secondary
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              BlocProvider.of<HabitsBloc>(context)
                                  .add(ToggleNewHabits());
                            },
                          ))
                    ],
                  ),
                ),
              ),
              state ? NewHabit() : Container()
            ],
          );
        },
      ),
    );
  }
}
