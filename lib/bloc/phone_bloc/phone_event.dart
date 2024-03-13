// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

@immutable
sealed class PhoneEvent {
  get verificationId => null;
}

@immutable
class InitialPhoneEvent extends PhoneEvent{
}
@immutable
class OTPEvent extends PhoneEvent {

 String verificationId;
  OTPEvent({required this.verificationId});
}



