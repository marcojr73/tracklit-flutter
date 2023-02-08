
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HabitsState { }

class ToggleNewHabits extends HabitsState{ }

class SetDayHabit extends HabitsState { }

class HabitsBloc extends Bloc<HabitsState, bool>{

  HabitsBloc(): super(false){
    on<ToggleNewHabits>((event, emit) => emit(!state));
  }
  
}