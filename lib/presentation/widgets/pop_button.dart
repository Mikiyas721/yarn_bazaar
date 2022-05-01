import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  final Color? iconColor;

  const PopButton({
    Key? key,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: iconColor,
      ),
    );
  }
}
