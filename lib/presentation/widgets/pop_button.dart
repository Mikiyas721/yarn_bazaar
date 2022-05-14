import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  final Color? iconColor;
  final VoidCallback? onPop;

  const PopButton({
    Key? key,
    this.iconColor,
    this.onPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPop??() {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: iconColor,
      ),
    );
  }
}
