abstract class HabitsEvent {}

class LoadHabitsEvent extends HabitsEvent {}

class ToggleHabitsEvent extends HabitsEvent {}

class NodaysSelectedEvent extends HabitsEvent {
  List<int> days = [];
}

class SelectDayHabitEvent extends HabitsEvent {
  int day;

  SelectDayHabitEvent({
    required this.day,
  });
}

class LoadedHabitsEvent extends HabitsEvent {
  List<int> days = [];
}