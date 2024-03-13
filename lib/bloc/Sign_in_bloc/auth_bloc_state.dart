import 'package:flutter/material.dart';

@immutable
sealed class AuthState {}
@immutable
class AuthInitialState extends AuthState {}

@immutable
class AuthLoadingState extends AuthState {}

@immutable
class AuthLoadedState extends AuthState {
  final String successMsg;
  AuthLoadedState({required this.successMsg});
}

@immutable
class AuthErrorState extends AuthState {
  final String msg;
  AuthErrorState({required this.msg});
}
