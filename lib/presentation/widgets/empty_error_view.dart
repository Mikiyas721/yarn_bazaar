import 'package:flutter/material.dart';
import 'my_image_view.dart';
import '../extensions.dart';

class EmptyErrorView extends StatelessWidget {
  final dynamic image;
  final String? title;
  final String? description;
  final String? actionLabel;
  final VoidCallback onReload;

  const EmptyErrorView({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.actionLabel,
    required this.onReload,
  }) : super(key: key);

  factory EmptyErrorView.defaultEmpty({
    dynamic image,
    String? title,
    String? description,
    String? actionLabel,
    required VoidCallback onReload,
  }) {
    return EmptyErrorView(
      image: image ?? 'assets/images/empty.png',
      title: title ?? 'No Data',
      description: description ?? 'You have no data in this section',
      actionLabel: actionLabel ?? 'Reload',
      onReload: onReload,
    );
  }

  factory EmptyErrorView.defaultError({
    dynamic image,
    String? title,
    String? description,
    String? actionLabel,
    required VoidCallback onRetry,
  }) {
    return EmptyErrorView(
      image: image ?? 'assets/images/error.png',
      title: title ?? 'Error',
      description: description ?? 'An error occurred while loading',
      actionLabel: actionLabel ?? 'Retry',
      onReload: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          MyImageView(
            image: image,
            fit: BoxFit.contain,
            height: 200,
          ),
        24.vSpace,
        Text(
          title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (description != null) 12.vSpace,
        if (description != null)
          Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        24.vSpace,
        if (actionLabel != null)
          OutlinedButton(
              onPressed: onReload,
              child: Text(
                actionLabel!,
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 0.7, color: context.primaryColor))),
      ],
    );
  }
}
