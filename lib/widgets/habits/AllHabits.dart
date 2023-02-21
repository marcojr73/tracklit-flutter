import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsEvent.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsState.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/index.dart';
import 'package:tracklit_flutter/repositories/habits/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';
import 'package:tracklit_flutter/utils/toasts/index.dart';
import 'package:tracklit_flutter/widgets/habits/day.dart';

class AllHabits extends StatefulWidget {
  const AllHabits({super.key, required this.allHabits, required this.reload});

  final List allHabits;
  final void Function() reload;

  @override
  State<AllHabits> createState() => _AllHabitsState();
}

class _AllHabitsState extends State<AllHabits> {
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

  void deleteHabit(context, int index) async {
    final response = await deleteHabitApi(index);
    if (response.statusCode == 204) {
      showSnackBar(context, "Deletado");
      widget.reload();
    } else {
      showSnackBar(context, response.body["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.allHabits.length,
        itemBuilder: (BuildContext context, int index) {
          final habit = widget.allHabits[index];
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${habit["name"]}",
                        style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.scrim),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "D",
                                index: 0,
                                isSelect: habit["days"].contains(0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "S",
                                index: 1,
                                isSelect: habit["days"].contains(1)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "T",
                                index: 2,
                                isSelect: habit["days"].contains(2)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "Q",
                                index: 3,
                                isSelect: habit["days"].contains(3)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "Q",
                                index: 4,
                                isSelect: habit["days"].contains(4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "S",
                                index: 5,
                                isSelect: habit["days"].contains(5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Day(
                                day: "S",
                                index: 6,
                                isSelect: habit["days"].contains(6)),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () => deleteHabit(context, habit["id"]),
                      icon: const Icon(
                        Icons.delete,
                        size: 25,
                        color: AppColors.red,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
