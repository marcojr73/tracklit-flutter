import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';
import 'package:tracklit_flutter/widgets/habits/index.dart';
import 'package:tracklit_flutter/widgets/hitoric/index.dart';
import 'package:tracklit_flutter/widgets/toDay/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedScreenIndex = 1;
  final List<Map<String, Object>> screens = [
    {"title": "Habits", "screen": const Today()},
    {
      "title": "Habits",
      "screen": BlocProvider(
        create: (context) => ShowHabits(),
        child: const Habits(),
      )
    },
    {"title": "Habits", "screen": const Historic()},
  ];

  selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: screens[selectedScreenIndex].cast()["screen"],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.emoji_events,
              ),
              label: "Habitos",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.view_day,
              ),
              label: "Hoje",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(
                Icons.today,
              ),
              label: "Histórico",
            ),
          ],
        ));
  }
}
