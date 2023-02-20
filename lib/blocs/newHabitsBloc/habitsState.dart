// ignore_for_file: annotate_overrides, overridden_fields

abstract class HabitsState {
  List<int> days = [];
}

class HabitsInitialState extends HabitsState {
  HabitsInitialState() : super();
}

class ShowNewHabitsState extends HabitsState {
  ShowNewHabitsState() : super();
}

class HiddenNewHabitsState extends HabitsState {
  HiddenNewHabitsState() : super();
}

class SelectedDaysState extends HabitsState {
  List<int> days;
  SelectedDaysState({required this.days}) : super();
}

class LoadingHabitsState extends HabitsState {
  LoadingHabitsState() : super();
}

class LoadHabitsSucessState extends HabitsState {
  List<dynamic> allHabits;
  LoadHabitsSucessState({required this.allHabits}) : super();
}

class HabitsEmptyState extends HabitsState {
  HabitsEmptyState() : super();
}

class FailHabitsState extends HabitsState {
  FailHabitsState() : super();
}