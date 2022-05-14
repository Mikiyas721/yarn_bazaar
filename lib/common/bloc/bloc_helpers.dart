import 'package:flutter/material.dart';

@immutable
abstract class BlocState {}

@immutable
abstract class BlocEvent<S extends BlocState> {
  S handle(S currentState);
}
