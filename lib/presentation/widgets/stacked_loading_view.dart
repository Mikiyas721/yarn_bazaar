import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/widgets/my_loading_view.dart';

import 'empty_error_view.dart';

class MyStackedLoadingView extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final String title;
  final VoidCallback onReload;

  const MyStackedLoadingView({
    Key? key,
    required this.isLoading,
    required this.error,
    this.title = 'Unable to load saved',
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isLoading || error != null)
        ? Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              color: Color(0x44FFFFFF),
              child: isLoading
                  ? MyLoadingView()
                  : EmptyErrorView.defaultError(
                      title: title,
                      description: error,
                      onRetry: onReload,
                    ),
            ))
        : SizedBox(width: 0, height: 0);
  }
}
