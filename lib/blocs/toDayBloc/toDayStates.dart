// ignore_for_file: annotate_overrides, overridden_fields

abstract class ToDayStates { }

class ToDayLoadingState extends ToDayStates {
  ToDayLoadingState() : super();
}

class ToDaySuccessState extends ToDayStates {
  List<dynamic> toDayHabits;
  ToDaySuccessState({required this.toDayHabits}) : super();
}

class ToDayEmptyState extends ToDayStates {
  ToDayEmptyState() : super();
}

class ToDayFailureState extends ToDayStates {
  ToDayFailureState() : super();
}