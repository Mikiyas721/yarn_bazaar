import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final VoidCallback onDiscardText;
  final VoidCallback onTap;
  final Function(String input) onChanged;

  const SearchField({
    Key? key,
    required this.onDiscardText,
    required this.onTap,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onTap: onTap,
      backgroundColor: Colors.black12,
      prefixIcon: const Icon(Icons.search),
      onSuffixTap: onDiscardText,
      placeholder: 'Search',
      onChanged: onChanged,
    );
  }
}
