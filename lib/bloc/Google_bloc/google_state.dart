// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

@immutable
sealed class GoogleState{
  const GoogleState();
}
@immutable
class GoogleInitialState extends GoogleState {
 const  GoogleInitialState();
}

@immutable
 class GoogleLoadingState extends GoogleState{}

@immutable
class GoogleLoadedState extends GoogleState {
 String successMsg;
  GoogleLoadedState(
    {required this.successMsg}
  );
 }

@immutable
 class GoogleErrorState extends GoogleState {
  String onError;
  GoogleErrorState({required this.onError});
   
 }
