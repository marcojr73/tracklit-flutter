import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:tracklit_flutter/utils/colors/index.dart';

class ToDayTitle extends StatefulWidget {
  const ToDayTitle({super.key, required this.percent});

  final String percent;

  @override
  State<ToDayTitle> createState() => _ToDayTitleState();
}

class _ToDayTitleState extends State<ToDayTitle> {
  String weekDay =
      DateFormat(DateFormat.WEEKDAY, "pt_br").format(DateTime.now());
  String date =
      DateFormat(DateFormat.ABBR_MONTH_DAY, "pt_br").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$weekDay, $date",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 30)),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "${widget.percent}% dos hábitos concluídos",
              style: const TextStyle(fontSize: 20, color: AppColors.green),
            ),
          )
        ],
      ),
    );
  }
}
