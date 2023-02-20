import 'package:bloc/bloc.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsEvent.dart';
import 'package:tracklit_flutter/blocs/newHabitsBloc/habitsState.dart';
import 'package:tracklit_flutter/repositories/habits/index.dart';

class NewHabitBloc extends Bloc<HabitsEvent, HabitsState> {
  bool isShowNewHabits = false;
  List<int> days = [];
  List<dynamic> allHabits = [];

  NewHabitBloc() : super(HabitsInitialState()) {
    on<ToggleHabitsEvent>((event, emit) {
      isShowNewHabits = !isShowNewHabits;
      if (isShowNewHabits) {
        days = [];
        emit(ShowNewHabitsState());
      } else {
        days = [];
        emit(HiddenNewHabitsState());
      }
    });

    on<SelectDayHabitEvent>((event, emit) {
      if (days.contains(event.day)) {
        days.remove(event.day);
      } else {
        days.add(event.day);
      }
      emit(SelectedDaysState(days: days));
    });

    on<LoadHabitsEvent>((event, emit) async {
      try {
        emit(LoadingHabitsState());
        allHabits = await getAllHabitsApi();
        if (allHabits.isNotEmpty) {
          emit(LoadHabitsSucessState(allHabits: allHabits));
        } else {
          emit(HabitsEmptyState());
        }
      } catch (e) {
        emit(FailHabitsState());
      }
    });
  }
}
