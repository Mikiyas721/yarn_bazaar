import 'package:flutter/material.dart';
import 'my_image_view.dart';
import '../ui_extensions.dart';

class EmptyErrorView extends StatelessWidget {
  final dynamic image;
  final String? title;
  final String? description;
  final String? actionLabel;
  final bool actionButtonIsFilled;
  final VoidCallback onReload;

  const EmptyErrorView({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.actionLabel,
    this.actionButtonIsFilled = false,
    required this.onReload,
  }) : super(key: key);

  factory EmptyErrorView.defaultEmpty({
    dynamic image,
    String? title,
    String? description,
    String? actionLabel,
    bool actionButtonIsFilled = false,
    required VoidCallback onReload,
  }) {
    return EmptyErrorView(
      image: image ?? 'assets/images/empty_indicator.png',
      title: title ?? 'No Data',
      description: description ?? 'You have no data in this section',
      actionLabel: actionLabel ?? 'Reload',
      actionButtonIsFilled: actionButtonIsFilled,
      onReload: onReload,
    );
  }

  factory EmptyErrorView.defaultError({
    dynamic image,
    String? title,
    String? description,
    String? actionLabel,
    bool actionButtonIsFilled = false,
    required VoidCallback onRetry,
  }) {
    return EmptyErrorView(
      image: image ?? 'assets/images/error_indicator.png',
      title: title ?? 'Error',
      description: description ?? 'An error occurred while loading',
      actionLabel: actionLabel ?? 'Retry',
      actionButtonIsFilled: actionButtonIsFilled,
      onReload: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (image != null)
          MyImageView(
            image: image,
            fit: BoxFit.contain,
            height: size.width*0.35,
          ),
        24.vSpace,
        Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: actionButtonIsFilled?Colors.white:Colors.black
          ),
        ),
        if (description != null) 12.vSpace,
        if (description != null)
          Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: actionButtonIsFilled?Colors.white:Colors.grey.shade600,
            ),
          ),
        24.vSpace,
        if (actionLabel != null)
          OutlinedButton(
            onPressed: onReload,
            child: Text(
              actionLabel!,
              style: actionButtonIsFilled?TextStyle(color: Colors.white):null,
            ),
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 0.7, color: context.primaryColor),
              backgroundColor: actionButtonIsFilled?context.primaryColor:null,
              minimumSize: Size(size.width*0.3, 40)
            ),
          ),
      ],
    );
  }
}
