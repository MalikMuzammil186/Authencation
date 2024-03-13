import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fir_base_auth_demo2/auth/service.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_event.dart';
import 'package:flutter_fir_base_auth_demo2/bloc/phone_bloc/phone_state.dart';

class PhoneBloc extends Bloc<PhoneEvent,PhoneState> {


  late TextEditingController phoneController;
  late TextEditingController smsController;
PhoneBloc():super(InitialPhoneState()) {
  phoneController=TextEditingController();
  smsController=TextEditingController();
  on<InitialPhoneEvent>(SignInPhoneNumber);

  on<OTPEvent>(sentOTPmEssage );
}

  FutureOr<void> SignInPhoneNumber(InitialPhoneEvent event, Emitter<PhoneState> emit)async {

   try {
      emit(LoadingPhoneStaet());

      AuthenticationServices authService=AuthenticationServices();
        await authService.signInWithPhoneNumber(phoneNumber: phoneController.text.toString(),);
        emit(LoadedPhoneState(sucessMsg: 'OTP is Sent  YOU  SucessFully'));
  

   } catch (e) {
   emit(ErorrPhoneState(erorrmsg: "OTP Sent IS Failed"));

     
   }
  }

  FutureOr<void> sentOTPmEssage(PhoneEvent event, Emitter<PhoneState> emit)async {


    try {
       emit(LoadingOTPstate());
      AuthenticationServices authService=AuthenticationServices();
      await authService.getOTPCode(verificationId: event.verificationId, smsCode: smsController.text);

      emit(LoadedOTPPhoneState(sucessMsg: 'OTP IS Sending'));
           
    } catch (e) {
     emit(ErorrPhoneState(erorrmsg: 'OTP IS NOT SENDING'));
    }
  }


@override
  Future<void> close() {
    phoneController.dispose();
    smsController.dispose();
    return super.close();
    
  }

  
}