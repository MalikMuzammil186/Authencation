import 'dart:async';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fir_base_auth_demo2/auth/service.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc_event.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/Sign_in_bloc/auth_bloc_state.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/behaviour.dart';

class AuthBloc extends Bloc<AuthEvents,AuthState> with AuthBehavior{
  late TextEditingController emailController;
  late TextEditingController passwordController;  
  AuthBloc():super(AuthInitialState()){
    emailController=TextEditingController();
    passwordController=TextEditingController();
    on<AuthInitialEvent>(mapEventToState);
  

  }


  FutureOr<void> mapEventToState(
    AuthInitialEvent event, Emitter<AuthState> emit)async {
      try {
        emit(AuthLoadingState());
        AuthenticationServices  authServices=AuthenticationServices();
        var userRecord=(emailController.text,passwordController.text);
        User? user= await authServices.creatUser(userRecord) ;
        if (user!=null) {
          emit(AuthLoadedState(successMsg: "SucessFully signUp"));
        }else{
          emit(AuthErrorState(msg: 'This User not Exist'));
        }
        
      }on FirebaseException catch (e) {
        var msg=checkException(erorrCodde: e.code);
        emit(AuthErrorState(msg: msg));
        
      }catch (e){
        developer.log(e.toString());
        emit(AuthErrorState(msg: 'some thing went wrong'));
        
      }
  }




  @override
  Future<void> close() {
  passwordController.dispose();
  emailController.dispose();
    return super.close();
  }



 
}