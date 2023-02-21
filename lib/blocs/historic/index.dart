import 'package:bloc/bloc.dart';
import 'package:tracklit_flutter/blocs/historic/historicEvents.dart';
import 'package:tracklit_flutter/blocs/historic/historicStates.dart';
import 'package:tracklit_flutter/repositories/historic/index.dart';

class HistoricBloc extends Bloc<HistoricEvents, HistoricStates> {
  List<dynamic> historic = [];

  HistoricBloc() : super(HistoricLoadingState()) {
    on<HistoricLoadHabitsEvent>((event, emit) async {
      try {
        historic = await getHistoriHabitsApi();
        emit(HistoricSuccessState(historic: historic));
      } catch (e) {
        emit(HistoricFailureState());
      }
    });
  }
}
