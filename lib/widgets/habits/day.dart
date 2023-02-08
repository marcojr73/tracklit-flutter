import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';

class Day extends StatelessWidget {
  const Day({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitsBloc, bool>(
      builder: (context, state) {
        return SizedBox(
          width: 45,
          child: ElevatedButton(
            onPressed: () {
              BlocProvider.of<HabitsBloc>(context).add(SetDayHabit());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: state
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.tertiary,
                side: BorderSide(
                    color: Theme.of(context).colorScheme.background, width: 2)),
            child: Text(
              day,
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            ),
          ),
        );
      },
    );
  }
}
