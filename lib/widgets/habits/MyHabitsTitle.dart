
import 'package:flutter/material.dart';

class MyHabitsTitle extends StatelessWidget {
  MyHabitsTitle({super.key, required this.toggleShowHabits});

  void Function() toggleShowHabits;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: Theme.of(context).colorScheme.secondary),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            toggleShowHabits();
                          },
                        ))
                  ]),
            );
  }
}