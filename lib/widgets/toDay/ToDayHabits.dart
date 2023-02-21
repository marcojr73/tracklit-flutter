import 'package:flutter/material.dart';
import 'package:tracklit_flutter/repositories/toDay/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

class ToDayHabits extends StatelessWidget {
  ToDayHabits({super.key, required this.toDayHabits, required this.reload});

  final List toDayHabits;
  void Function() reload;

  void postCheckUncheckHabit(bool isDone, int habitId) async {
    if (!isDone) {
      final response = await postDoneToDayHabitApi(habitId);
      print(response);
      if (response == 204) {
        reload();
      }
    } else {
      final response = await postNotDoneToDayHabitApi(habitId);
      if (response == 204) {
        reload();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          itemCount: toDayHabits.length,
          itemBuilder: (BuildContext context, int index) {
            final habit = toDayHabits[index];
            return Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
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
                                  color: Theme.of(context).colorScheme.scrim),
                            ),
                            Text(
                              "${habit["currentSequence"]} dias",
                              style: TextStyle(
                                  color: habit["done"]
                                      ? AppColors.green
                                      : Theme.of(context).colorScheme.scrim),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text("Seu recorde: ",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.scrim)),
                            Text("${habit["highestSequence"]} dias",
                                style: TextStyle(
                                    color: habit["highestSequence"] ==
                                                habit["currentSequence"] &&
                                            habit["done"]
                                        ? AppColors.green
                                        : Theme.of(context).colorScheme.scrim))
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
                            postCheckUncheckHabit(habit["done"], habit["id"]);
                          },
                          padding: const EdgeInsets.only(right: 3, bottom: 3),
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
  }
}
