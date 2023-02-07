import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';
import 'package:tracklit_flutter/widgets/habits/day.dart';

class NewHabit extends StatelessWidget {
  NewHabit({super.key});

  var formData = <String, String>{};

  final List<String> daysWeek = ["D", "S", "T", "Q", "Q", "S", "S"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.3,
        color: Theme.of(context).colorScheme.tertiary,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: "Nome do hábito", border: OutlineInputBorder()),
              textInputAction: TextInputAction.next,
              obscureText: false,
              onSaved: (e) => formData["habit"] = e ?? "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Day(day: "D"),
                Day(day: "S"),
                Day(day: "T"),
                Day(day: "Q"),
                Day(day: "Q"),
                Day(day: "S"),
                Day(day: "S"),
              ],
            ),
          ),
          BlocBuilder<ShowHabits, bool>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    BlocProvider.of<ShowHabits>(context).add(HabitsBloc());
                  }, child: const Text("Cancelar")),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<ShowHabits>(context).add(HabitsBloc());
                        }, child: const Text("Salvar")),
                  )
                ],
              );
            },
          )
        ]),
      ),
    );
  }
}
