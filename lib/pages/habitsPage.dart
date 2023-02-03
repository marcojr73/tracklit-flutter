import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';
import 'package:tracklit_flutter/widgets/habits/newHabit.dart';

class HabitsPage extends StatelessWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          toolbarHeight: 75,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Tracklit"),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Image.asset(
                  "assets/images/Karma_0.jpg",
                  width: 50,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ShowHabits, bool>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Meus hábitos",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 40),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<ShowHabits>(context).add(HabitsBloc());
                          }, child: const Icon(Icons.plus_one))
                    ],
                  ),
                ),
                state ? NewHabit() : Container()
              ],
            );
          },
        ));
  }
}
