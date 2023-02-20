import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

class ToDayTitle extends StatelessWidget {
  const ToDayTitle({super.key, required this.percent});

  final String percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Segunda, 20/02",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30)),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "$percent% dos hábitos concluídos",
              style: const TextStyle(fontSize: 20, color: AppColors.green),
            ),
          )
        ],
      ),
    );
  }
}
