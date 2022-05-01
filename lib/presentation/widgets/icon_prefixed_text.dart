import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class IconPrefixedText extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Color? color;

  const IconPrefixedText({
    Key? key,
    required this.icon,
    required this.label,
    this.overflow,
    this.softWrap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 18,
        ),
        2.hSpace,
        Text(
          label,
          overflow: overflow,
          softWrap: softWrap,
          style: TextStyle(
            color: color,
            fontSize: 12
          ),
        ),
      ],
    );
  }
}
