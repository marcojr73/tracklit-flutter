import 'package:flutter/material.dart';
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
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedScreenIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Tracklit",
                style: TextStyle(fontFamily: "Playball", fontSize: 40),
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/unnamed.jpg"),
                radius: 25,
              )
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: PageView(
            controller: pageController,
            children: const [
              Habits(),
              Today(),
              Historic(),
            ],
            onPageChanged: (page) {
              setState(() {
                selectedScreenIndex = page;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease);
          },
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
              label: "Hist??rico",
            ),
          ],
        ));
  }
}
