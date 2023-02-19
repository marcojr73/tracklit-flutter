abstract class HabitsState {
  List<int> days;

  HabitsState({
    required this.days,
  });
}

class HabitsInitialState extends HabitsState {
  HabitsInitialState() : super(days: []);
}

class LoadHabitsState extends HabitsState {
  LoadHabitsState() : super(days: []);
}

class ShowNewHabitsState extends HabitsState {
  ShowNewHabitsState() : super(days: []);
}

class HiddenNewHabitsState extends HabitsState {
  HiddenNewHabitsState() : super(days: []);
}

class SelectedDaysState extends HabitsState {
  List<int> days;
  SelectedDaysState({required this.days}) : super(days: days);
}
