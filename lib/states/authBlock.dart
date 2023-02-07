import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState{}

class TogglePage extends Bloc<AuthState, bool>{
  
  TogglePage(): super(true){
    on<AuthInitial>((event, emit) => emit(!state));
  }
  
}