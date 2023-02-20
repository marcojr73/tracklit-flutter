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
  const AllHabits({super.key});

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
      showSnackBar(context, "sucess");
      bloc.add(LoadHabitsEvent());
    } else {
      showSnackBar(context, response.body["message"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitBloc, HabitsState>(
      bloc: bloc,
      builder: (context, state) {
        return state is LoadingHabitsState
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 100),
                child: Center(child: CircularProgressIndicator()),
              )
            : state is LoadHabitsSucessState
                ? ListView.builder(
                    itemCount: state.allHabits.length,
                    itemBuilder: (BuildContext context, int index) {
                      final habit = state.allHabits[index];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${habit["name"]}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .scrim),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "D",
                                            index: 1,
                                            isSelect: habit["days"].contains(1)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "S",
                                            index: 2,
                                            isSelect: habit["days"].contains(2)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "T",
                                            index: 3,
                                            isSelect: habit["days"].contains(3)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "Q",
                                            index: 4,
                                            isSelect: habit["days"].contains(4)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "Q",
                                            index: 5,
                                            isSelect: habit["days"].contains(5)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "S",
                                            index: 6,
                                            isSelect: habit["days"].contains(6)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Day(
                                            day: "S",
                                            index: 7,
                                            isSelect: habit["days"].contains(7)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () =>
                                      deleteHabit(context, habit["id"]),
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 25,
                                    color: AppColors.red,
                                  ))
                            ],
                          ),
                        ),
                      );
                    })
                : state is HabitsEmptyState
                    ? Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.only(left: 30, top: 40),
                        child: Text(
                          "Você não tem nenhum hábito cadastrado ainda. Adicione um hábito para começar a trackear!",
                          style: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.scrim,
                          ),
                        ))
                    : Container();
      },
    );
  }
}
