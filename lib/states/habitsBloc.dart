import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HabitsState {}

class HabitsBloc extends HabitsState{}

class ShowHabits extends Bloc<HabitsState, bool>{
  
  ShowHabits(): super(false){
    on<HabitsBloc>((event, emit) => emit(!state));
  }
  
}