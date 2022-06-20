import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/value_objects/user_type.dart';
import 'package:yarn_bazaar/common/enum_extensions.dart';

extension SpacingExtension on num {
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  Widget get hSpace => SizedBox(width: toDouble());

  Widget get vSpace => SizedBox(height: toDouble());
}

extension BuildContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get secondaryHeaderColor => Theme.of(this).secondaryHeaderColor;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;

  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
}

extension StringExtension on String {
  Color getAccountTypeColor() {
    if (this == UserType.yarn_manufacturer.getString() ||
        this == UserType.fabric_manufacturer.getString() ||
        this == UserType.fabric_manufacturer.getShortString())
      return Colors.blueGrey;
    else if (this == UserType.yarn_trader.getString())
      return Colors.lightGreen;
    else if (this == UserType.yarn_broker.getString())
      return Colors.orange;
    else
      return Colors.red;
  }

  Color getYarnColorBackground() {
    if (this == myYarnColors[0])
      return Color(0xB7AB9F);
    else if (this == myYarnColors[1])
      return Colors.white;
    else if (this == myYarnColors[2])
      return Colors.black;
    else if (this == myYarnColors[3])
      return Color(0xFFFFEDD7);
    else if (this == myYarnColors[4])
      return Colors.red;
    else if (this == myYarnColors[5])
      return Colors.red;
    else if (this == myYarnColors[6])
      return Colors.red;
    else if (this == myYarnColors[7])
      return Color(0xFF726450);
    else if (this == myYarnColors[8])
      return Colors.white70;
    else if (this == myYarnColors[9])
      return Color(0xFF4169E1);
    else if (this == myYarnColors[10])
      return Color(0xFF000080);
    else if (this == myYarnColors[11])
      return Color(0xFF800000);
    else
      return Color(0xFFFF9F10);
  }

  Color getYarnColorForeground() {
    if (this == myYarnColors[0])
      return Colors.black;
    else if (this == myYarnColors[1])
      return Colors.black;
    else if (this == myYarnColors[2])
      return Colors.white;
    else if (this == myYarnColors[3])
      return Colors.red;
    else if (this == myYarnColors[4])
      return Colors.black;
    else if (this == myYarnColors[5])
      return Colors.white;
    else if (this == myYarnColors[6])
      return Colors.white;
    else if (this == myYarnColors[7])
      return Colors.white;
    else if (this == myYarnColors[8])
      return Colors.white;
    else if (this == myYarnColors[9])
      return Colors.white;
    else if (this == myYarnColors[10])
      return Colors.white;
    else if (this == myYarnColors[11])
      return Colors.white;
    else
      return Colors.white;
  }
}

final myYarnColors = [
  "Greige",
  "White / Bleach White",
  "Black",
  "Dop Dyed",
  "Yarn Dyed",
  "Red",
  "Space Dyed",
  "Melange",
  "RFD",
  "R.Blue",
  "N.Blue",
  "Maroon",
];
