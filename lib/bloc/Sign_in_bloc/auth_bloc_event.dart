
import 'package:flutter/material.dart';

@immutable
sealed class AuthEvents {}

@immutable
class AuthInitialEvent extends AuthEvents {
  AuthInitialEvent();
}