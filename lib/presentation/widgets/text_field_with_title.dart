import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class TextFieldWithTitle extends StatelessWidget {
  final String title;
  final bool usesPrimaryColor;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorMessage;
  final bool? fieldIsOptional;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;

  const TextFieldWithTitle({
    Key? key,
    required this.title,
    this.usesPrimaryColor = true,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorMessage,
    this.fieldIsOptional,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Text(
              title,
              style: TextStyle(
                color: usesPrimaryColor ? context.primaryColor : null,
              ),
            ),
            fieldIsOptional != null
                ? fieldIsOptional!
                    ? Text(
                        ' (optional)',
                        style: TextStyle(color: context.primaryColor),
                      )
                    : const Text('*', style: TextStyle(color: Colors.red))
                : const Text('')
          ]),
          TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                label: labelText == null ? null : Text(labelText!),
                hintText: hintText,
                errorText: errorMessage,
                suffixIcon: suffixIcon,
                hintStyle: const TextStyle(fontSize: 12, color: Colors.grey)),
            enabled: enabled,
            onTap: onTap,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            readOnly: readOnly,
          )
        ],
      ),
    );
  }
}
