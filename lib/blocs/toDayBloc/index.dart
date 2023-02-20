import 'package:bloc/bloc.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayEvents.dart';
import 'package:tracklit_flutter/blocs/toDayBloc/toDayStates.dart';
import 'package:tracklit_flutter/repositories/toDay/index.dart';

class ToDayBloc extends Bloc<ToDayEvents, ToDayStates> {

  List<dynamic> toDayHabits = [];

  ToDayBloc() : super(ToDayLoadingState()) {

    on<ToDayLoadHabitsEvent>((event, emit) async {
      try {
        emit(ToDayLoadingState());
        toDayHabits = await getToDayHabitsApi();
        if(toDayHabits.isEmpty) emit(ToDayEmptyState());
        if(toDayHabits.isNotEmpty) emit(ToDaySuccessState(toDayHabits: toDayHabits));
      } catch (e) {
        emit(ToDayFailureState());
      }
    });

    on<CheckDoneToDayHabitEvent>((event, emit) async {
      try {
        toDayHabits = await getToDayHabitsApi();
        emit(ToDaySuccessState(toDayHabits: toDayHabits));
      } catch (e) {
        emit(ToDayFailureState());
      }
    });
  }
}
