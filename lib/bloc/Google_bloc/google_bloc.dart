import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fir_base_auth_demo2/auth/service.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Google_bloc/google_event.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Google_bloc/google_state.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/behaviour.dart';

class GoogleBloc extends Bloc<GoogleEvent,GoogleState> with AuthBehavior {
  GoogleBloc():super(const GoogleInitialState()){
    on<GoogleInitialEvent>(signInWithGoogle);

  }
  

  FutureOr<void> signInWithGoogle(
    GoogleInitialEvent event, Emitter<GoogleState> emit) async{
      emit(GoogleLoadingState());
      try {
        AuthenticationServices authService=AuthenticationServices();
        
        
      } catch (e) {
        
      }
  }
}