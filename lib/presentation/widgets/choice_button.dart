import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class ChoiceButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool hasMaxWidth;
  final bool elevates;
  final void Function(bool isElevated) onClick;

  const ChoiceButton({
    Key? key,
    required this.label,
    required this.isSelected,
    this.hasMaxWidth = true,
    this.elevates = false,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return elevates
        ? isSelected
            ? ElevatedButton(
                onPressed: () {
                  onClick(!isSelected);
                },
                child: Text(label),
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        hasMaxWidth ? const Size(double.infinity, 45) : null),
              )
            : OutlinedButton(
                onPressed: () {
                  onClick(!isSelected);
                },
                child: Text(label),
                style: OutlinedButton.styleFrom(
                    minimumSize:
                        hasMaxWidth ? const Size(double.infinity, 45) : null),
              )
        : OutlinedButton(
            onPressed: () {
              onClick(!isSelected);
            },
            child: isSelected
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 0, width: 20),
                      Text(
                        label,
                        style: TextStyle(color: context.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: context.primaryColor,
                        size: 20,
                      )
                    ],
                  )
                : Text(
                    label,
                    style: const TextStyle(color: Colors.grey),
                  ),
            style: OutlinedButton.styleFrom(
              minimumSize: hasMaxWidth ? const Size(double.infinity, 45) : null,
              side: BorderSide(
                width: 0.7,
                color: isSelected ? context.primaryColor : Colors.grey,
              ),
            ),
          );
  }
}
