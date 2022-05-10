import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class MyActionButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final double minWidth;
  final double? elevation;
  final EdgeInsets? padding;
  final VoidCallback onSubmit;

  const MyActionButton({
    Key? key,
    required this.label,
    this.isLoading = false,
    this.minWidth = double.infinity,
    this.elevation,
    this.padding,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          padding: padding,
          elevation: elevation,
          backgroundColor: context.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
          minimumSize: Size(minWidth, 48)),
      onPressed: onSubmit,
      child: isLoading
          ? const CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Text(label,
              style: const TextStyle(
                color: Colors.white,
              )),
    );
  }
}
