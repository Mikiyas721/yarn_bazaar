import 'package:flutter/material.dart';

class OutlinedElevatedButton extends StatelessWidget {
  final String label;
  final bool isElevated;
  final void Function(bool isElevated) onClick;

  const OutlinedElevatedButton({
    Key? key,
    required this.label,
    required this.isElevated,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isElevated
        ? ElevatedButton(
            onPressed: () {
              onClick(isElevated);
            },
            child: Text(label),
          )
        : OutlinedButton(
            onPressed: () {
              onClick(isElevated);
            },
            child: Text(label),
          );
  }
}
