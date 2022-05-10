import 'package:flutter/material.dart';

import 'models/add_yarn_requirement_view_model.dart';

extension SpacingExtension on num {
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  Widget get hSpace => SizedBox(width: toDouble());

  Widget get vSpace => SizedBox(height: toDouble());
}

extension BuildContextExtension on BuildContext{
  Color get primaryColor=> Theme.of(this).primaryColor;
  Color get secondaryHeaderColor=> Theme.of(this).secondaryHeaderColor;

  TextStyle? get headline2=> Theme.of(this).textTheme.headline2;
  TextStyle? get headline3=> Theme.of(this).textTheme.headline3;
  TextStyle? get headline4=> Theme.of(this).textTheme.headline4;
  TextStyle? get headline5=> Theme.of(this).textTheme.headline5;
  TextStyle? get headline6=> Theme.of(this).textTheme.headline6;
  TextStyle? get caption=> Theme.of(this).textTheme.caption;
}



