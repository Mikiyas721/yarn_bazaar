import 'package:flutter/material.dart';

@immutable
abstract class BlocState {}

@immutable
abstract class BlocEvent<S extends BlocState> {
  Stream<S> handle(S currentState);
}
