import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  Day(
      {super.key,
      required this.day,
      required this.index,
      required this.isSelect,
      required this.upsertSelectedHabits});

  final String day;
  final int index;
  bool isSelect;
  final void Function(int) upsertSelectedHabits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 35,
      child: ElevatedButton(
        onPressed: () => upsertSelectedHabits(index),
        style: isSelect
            ? ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary)
            : ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                side: BorderSide(
                    color: Theme.of(context).colorScheme.background, width: 2)),
        child: Text(
          day,
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }
}
