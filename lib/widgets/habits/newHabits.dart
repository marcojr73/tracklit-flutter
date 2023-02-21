import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/index.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsEvent.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsState.dart';
import 'package:tracklit_flutter/models/postHabitModel.dart';
import 'package:tracklit_flutter/repositories/habits/index.dart';
import 'package:tracklit_flutter/utils/toasts/index.dart';
import 'package:tracklit_flutter/widgets/habits/MyHabitsTitle.dart';
import 'package:tracklit_flutter/widgets/habits/day.dart';

class NewHabits extends StatefulWidget {
  NewHabits({super.key, required this.reload});
  void Function() reload;

  @override
  State<NewHabits> createState() => _NewHabitsState();
}

class _NewHabitsState extends State<NewHabits> {
  var formData = <String, String>{};
  final formKey = GlobalKey<FormState>();

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

  void upsertSelectedHabits(index) {
    bloc.add(SelectDayHabitEvent(day: index));
  }

  void toggleShowHabits() {
    bloc.add(ToggleHabitsEvent());
  }

  void postHabit(List<int> days) async {
    formKey.currentState?.validate() ?? false;
    if (days.isEmpty) {
      showSnackBar(context, "Selecione um ou mais dias");
    } else {
      formKey.currentState?.save();
      final data = TpostHabit(name: formData["name"] as String, days: days);
      final response = await postHabitApi(data);
      if (response.statusCode == 201) {
        showSnackBar(context, "sucesso");
        widget.reload();
        bloc.add(ToggleHabitsEvent());
      } else {
        showSnackBar(context, response.body["message"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewHabitBloc, HabitsState>(
      bloc: bloc,
      builder: (context, state) {
        List<int> days = state.days;
        return Column(
          children: [
            MyHabitsTitle(toggleShowHabits: toggleShowHabits),
            if (state is ShowNewHabitsState || state is SelectedDaysState)
              Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Form(
                              key: formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Container(
                                  height: 40,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Nome do hábito",
                                      border: OutlineInputBorder(),
                                    ),
                                    textInputAction: TextInputAction.send,
                                    obscureText: false,
                                    validator: (_e) {
                                      final e = _e ?? "";
                                      if (e.isEmpty) {
                                        return "insira um valor válido";
                                      }
                                      return null;
                                    },
                                    onSaved: (e) => formData["name"] = e ?? "",
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Day(
                                  day: "D",
                                  index: 0,
                                  isSelect: days.contains(0),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "S",
                                  index: 1,
                                  isSelect: days.contains(1),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "T",
                                  index: 2,
                                  isSelect: days.contains(2),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "Q",
                                  index: 3,
                                  isSelect: days.contains(3),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "Q",
                                  index: 4,
                                  isSelect: days.contains(4),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "S",
                                  index: 5,
                                  isSelect: days.contains(5),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                                Day(
                                  day: "S",
                                  index: 6,
                                  isSelect: days.contains(6),
                                  upsertSelectedHabits: upsertSelectedHabits,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      bloc.add(ToggleHabitsEvent());
                                    },
                                    child: Text(
                                      "Cancelar",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 15, left: 20),
                                  child: SizedBox(
                                    height: 25,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          postHabit(days);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        child: const Text("Salvar")),
                                  ),
                                )
                              ],
                            )
                          ])))
            else
              Container()
          ],
        );
      },
    );
  }
}
