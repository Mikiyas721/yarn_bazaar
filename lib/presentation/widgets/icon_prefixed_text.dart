import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class IconPrefixedText extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Color? iconColor;
  final double iconSize;
  final TextStyle? textStyle;

  const IconPrefixedText({
    Key? key,
    required this.icon,
    required this.label,
    this.overflow,
    this.softWrap,
    this.iconColor,
    this.iconSize = 18,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        2.hSpace,
        Text(
          label,
          overflow: overflow,
          softWrap: softWrap,
          style: textStyle,
        ),
      ],
    );
  }
}
