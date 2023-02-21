import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/index.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayEvents.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayStates.dart';
import 'package:tracklit_flutter/widgets/toDay/ToDayHabits.dart';
import 'package:tracklit_flutter/widgets/toDay/toDayTitle.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  late final ToDayBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ToDayBloc();
    bloc.add(ToDayLoadHabitsEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void reload() {
    bloc.add(ToDayLoadHabitsEvent());
  }

  String percentDoneCalc(List<dynamic> toDayHabits) {
    int done = 0;
    for (var habit in toDayHabits) {
      if (habit["done"] == true) {
        done++;
      }
    }
    return ((done / toDayHabits.length * 100).toStringAsFixed(0));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: BlocBuilder<ToDayBloc, ToDayStates>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ToDaySuccessState) {
              final percentDone = percentDoneCalc(state.toDayHabits);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ToDayTitle(
                    percent: percentDone,
                  ),
                  ToDayHabits(
                    toDayHabits: state.toDayHabits,
                    reload: reload,
                  )
                ],
              );
            } else if (state is ToDayLoadingState) {
              return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 100),
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is ToDayEmptyState) {
              return Padding(
                padding: const EdgeInsets.all(50),
                child: Text(
                  "Você não tem nenhum hábito para hoje. Adicione um hábito para começar a trackear!",
                  style: TextStyle(
                      fontSize: 25, color: Theme.of(context).colorScheme.scrim),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
