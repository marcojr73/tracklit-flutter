import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState { }

class TogglePage extends AuthState{ }

class AuthBloc extends Bloc<AuthState, bool>{

  AuthBloc(): super(true){
    on<TogglePage>((event, emit) => emit(!state));
  }
  
}