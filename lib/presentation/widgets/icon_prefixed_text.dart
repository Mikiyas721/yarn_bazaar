import 'package:flutter/material.dart';

class IconPrefixedText extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextOverflow? overflow;
  final bool? softWrap;

  const IconPrefixedText({
    Key? key,
    required this.icon,
    required this.label,
    this.overflow,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Text(
          label,
          overflow: overflow,
          softWrap: softWrap,
        ),
      ],
    );
  }
}
