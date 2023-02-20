import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/index.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayEvents.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayStates.dart';
import 'package:tracklit_flutter/repositories/toDay/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

class ToDayHabits extends StatefulWidget {
  ToDayHabits({super.key, required this.habits, required this.reload});

  final List<dynamic> habits;
  void Function() reload;

  @override
  State<ToDayHabits> createState() => _ToDayHabitsState();
}

class _ToDayHabitsState extends State<ToDayHabits> {
  late final ToDayBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ToDayBloc();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void postCheckUncheckHabit(bool isDone, int habitId) async {
    if (!isDone) {
      final response = await postDoneToDayHabitApi(habitId);
      print(response);
      if (response == 204) {
        bloc.add(CheckDoneToDayHabitEvent());
      }
    } else {
      final response = await postNotDoneToDayHabitApi(habitId);
      if (response == 204) {
        bloc.add(CheckDoneToDayHabitEvent());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToDayBloc, ToDayStates>(
      bloc: bloc,
      builder: (context, state) {
        print(state);
        if (state is ToDaySuccessState || state is ToDayLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: widget.habits.length,
                itemBuilder: (BuildContext context, int index) {
                  final habit = widget.habits[index];
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                habit["name"],
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.scrim,
                                    fontSize: 25),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Sequência atual: ",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .scrim),
                                  ),
                                  Text(
                                    "${habit["currentSequence"]} dias",
                                    style: TextStyle(
                                        color: habit["done"]
                                            ? AppColors.green
                                            : Theme.of(context)
                                                .colorScheme
                                                .scrim),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Seu recorde: ",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .scrim)),
                                  Text("${habit["highestSequence"]} dias",
                                      style: TextStyle(
                                          color: habit["highestSequence"] ==
                                                      habit[
                                                          "currentSequence"] &&
                                                  habit["done"]
                                              ? AppColors.green
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .scrim))
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: habit["done"] == true
                                  ? AppColors.green
                                  : Theme.of(context).colorScheme.background,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  postCheckUncheckHabit(
                                      habit["done"], habit["id"]);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  size: 50,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  );
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
