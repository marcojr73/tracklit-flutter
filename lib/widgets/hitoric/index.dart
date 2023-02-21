import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tracklit_flutter/blocs/historic/historicEvents.dart';
import 'package:tracklit_flutter/blocs/historic/historicStates.dart';
import 'package:tracklit_flutter/blocs/historic/index.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

class Historic extends StatefulWidget {
  const Historic({super.key});

  @override
  State<Historic> createState() => _HistoricState();
}

class _HistoricState extends State<Historic> {
  late final HistoricBloc bloc;

  List<DateTime> events = [];
  var focusedDay = DateTime.now();
  var selectedDay = DateTime.now();

  bool isAllDone(day, List<dynamic> allEvents) {
    day = DateFormat("yyyy-MM-dd").format(day);
    List eventsDaysDone = organizeEvents(allEvents);
    for (var event in eventsDaysDone) {
      if (event == day) {
        return true;
      }
    }
    return false;
  }

  List organizeEvents(List events) {
    List ans = [
      "2023-02-20",
      "2023-02-18",
      "2023-02-16",
      "2023-02-15",
      "2023-02-14",
      "2023-02-13",
      "2023-02-11",
      "2023-02-08",
      "2023-02-06",
      "2023-02-05",
      "2023-02-0",
    ];
    for (var event in events) {
      var count = 0;
      for (var habit in event["habits"]) {
        if (habit["done"]) {
          count++;
        }
      }

      if (count == event["habits"].length) {
        DateTime parser = DateTime.parse(event["habits"][0]["date"]);
        ans.add(DateFormat("yyyy-MM-dd").format(parser));
      }
    }
    return ans;
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    bloc = HistoricBloc();
    bloc.add(HistoricLoadHabitsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  var now = DateTime.now();
  final firstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final lastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

  List<DateTime> ans = [
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 5),
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 7)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoricBloc, HistoricStates>(
      bloc: bloc,
      builder: (context, state) {
        if (state is HistoricLoadingState) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 100),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is HistoricSuccessState) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                TableCalendar(
                  eventLoader: (day) {
                    if (isAllDone(day, state.historic)) {
                      return [true];
                    }
                    return [];
                  },
                  focusedDay: now,
                  firstDay: firstDay,
                  lastDay: lastDay,
                  headerStyle: HeaderStyle(
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 22),
                      titleCentered: true),
                  calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle),
                      todayDecoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.rectangle),
                      weekendTextStyle: const TextStyle(color: AppColors.red)),
                  calendarBuilders:
                      CalendarBuilders(markerBuilder: (context, day, events) {
                    if (events.isNotEmpty) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              bottom: 6.0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                    color: AppColors.green,
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ))
                        ],
                      );
                    } else if(day.isBefore(focusedDay)) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              bottom: 6.0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ))
                        ],
                      );
                    }
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20, top: 25),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                            color: AppColors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child:
                            Text("Dias em que você concluiu todos os hábitos"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                                BorderRadius.all(Radius.circular(25))
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Dias em que você não concluiu todos os hábitos"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Dia de hoje"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
