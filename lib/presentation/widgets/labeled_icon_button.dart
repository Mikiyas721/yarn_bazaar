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
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 85),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 78),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: filled ? Colors.white : iconColor,
                      size: 34,
                    ),
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
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 0.2,
                  color: Colors.black26,
                )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
