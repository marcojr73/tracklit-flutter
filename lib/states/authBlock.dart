import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ToggleState {}

class Toggle extends ToggleState{}

class ToggleBloc extends Bloc<ToggleState, bool>{
  
  ToggleBloc(): super(true){
    on<Toggle>((event, emit) => emit(!state));
  }
  
}