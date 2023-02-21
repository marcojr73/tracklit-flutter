// ignore_for_file: annotate_overrides, overridden_fields

abstract class HistoricStates { }

class HistoricLoadingState extends HistoricStates {
  HistoricLoadingState() : super();
}

class HistoricSuccessState extends HistoricStates {
  List<dynamic> historic;
  HistoricSuccessState({required this.historic}) : super();
}

class HistoricEmptyState extends HistoricStates {
  HistoricEmptyState() : super();
}

class HistoricFailureState extends HistoricStates {
  HistoricFailureState() : super();
}