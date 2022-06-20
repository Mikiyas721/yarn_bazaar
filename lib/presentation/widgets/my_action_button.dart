import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class MyActionButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final double minWidth;
  final double? elevation;
  final EdgeInsets? padding;
  final bool isEnabled;
  final VoidCallback onSubmit;

  const MyActionButton({
    Key? key,
    required this.label,
    this.isLoading = false,
    this.minWidth = double.infinity,
    this.elevation,
    this.padding,
    this.isEnabled = true,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          textStyle: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16
          ),
          padding: padding,
          elevation: elevation,
          backgroundColor: isEnabled ? context.primaryColor : Colors.black12,
          shape:
              const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
          minimumSize: Size(minWidth, 48)),
      onPressed: isEnabled && !isLoading ? onSubmit : null,
      child: isLoading
          ? SizedBox(
              height: 32,
              width: 32,
              child: const CircularProgressIndicator(backgroundColor: Colors.white),
            )
          : Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}
