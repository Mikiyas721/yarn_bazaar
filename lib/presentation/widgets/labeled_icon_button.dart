import 'package:flutter/material.dart';

class LabeledIconButton extends StatelessWidget {
  final IconData iconData;
  final String label;
  final Color iconColor;
  final VoidCallback onTap;
  final bool filled;

  const LabeledIconButton({
    Key? key,
    required this.iconData,
    required this.label,
    required this.iconColor,
    required this.onTap,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Container(
              child: Icon(
                iconData,
                color: iconColor,
              ),
              decoration: BoxDecoration(
                gradient: filled
                    ? LinearGradient(
                        colors: [iconColor, iconColor.withOpacity(0.8)])
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: iconColor),
              ),
            ),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Text(label)
        ],
      ),
      onTap: onTap,
    );
  }
}
