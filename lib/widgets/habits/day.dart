import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklit_flutter/states/habitsBloc.dart';

class Day extends StatelessWidget {
  const Day({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowHabits, bool>(
      builder: (context, state) {
        return Container(
          width: 45,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(day),
          ),
        );
      },
    );
  }
}
