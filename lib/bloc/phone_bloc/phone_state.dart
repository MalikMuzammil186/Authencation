// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
sealed class PhoneState {}

class InitialPhoneState extends PhoneState {}

class LoadingPhoneStaet extends PhoneState {}

class LoadedPhoneState extends PhoneState {
  String sucessMsg;
  LoadedPhoneState({required this.sucessMsg});
  
}
class LoadedOTPPhoneState extends PhoneState {
  String sucessMsg;
  LoadedOTPPhoneState({required this.sucessMsg});
  
}
// class PhoneAuthSentCodeScessus extends PhoneState{
// final String verificationId;
// PhoneAuthSentCodeScessus({required this.verificationId});  
// }


class LoadingOTPstate extends PhoneState {
}

@immutable
class ErorrPhoneState extends PhoneState {
  String erorrmsg;
  ErorrPhoneState({required this.erorrmsg});
  
}
