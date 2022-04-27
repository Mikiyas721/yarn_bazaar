import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final VoidCallback onDiscardText;

  const SearchField({
    Key? key,
    required this.onDiscardText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          label: const Text('Search'),
          suffix: IconButton(
            icon: const Icon(Icons.close),
            onPressed: onDiscardText,
          )),
    );
  }
}
