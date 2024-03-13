import 'package:flutter/material.dart';

@immutable
sealed class GoogleEvent{
}
@immutable
class GoogleInitialEvent extends GoogleEvent{
  GoogleInitialEvent();
}