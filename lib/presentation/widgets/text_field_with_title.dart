import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/extensions.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final String? textFieldValue;
  final String? labelText;
  final String? hintText;
  final String? errorMessage;
  final bool? fieldIsOptional;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const TextFieldWithTitle({
    Key? key,
    required this.title,
    required this.textFieldValue,
    this.hintText,
    this.labelText,
    this.errorMessage,
    this.fieldIsOptional,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: title),
          fieldIsOptional != null
              ? fieldIsOptional!
                  ? TextSpan(
                      text: ' (optional)',
                      style: TextStyle(color: context.primaryColor))
                  : const TextSpan(
                      text: '*', style: TextStyle(color: Colors.red))
              : const TextSpan(text: '')
        ])),
        TextField(
          controller: TextEditingController(text: textFieldValue),
          decoration: InputDecoration(
            label: labelText == null ? null : Text(labelText!),
            hintText: hintText,
            errorText: errorMessage,
            suffixIcon: suffixIcon,
          ),
          onTap: onTap,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          readOnly: readOnly,
        )
      ],
    );
  }
}
