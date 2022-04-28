import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NavigateButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), const Icon(Icons.arrow_forward_ios_outlined)],
        ),
      ),
      onTap: onTap,
    );
  }
}
