import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class MyImageView extends StatelessWidget {
  final dynamic image;
  final BoxFit fit;
  final double? height;
  final double? width;

  const MyImageView({
    Key? key,
    this.image,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildImage(),
    );
  }

  Widget buildImage() {
    return Image(
      image: _imageProvider(image),
      height: height,
      width: width,
      fit: fit,
    );
  }
}

class MyCircleAvatar extends StatelessWidget {
  final dynamic image;
  final String? initials;
  final Color? backgroundColor;
  final double radius;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  const MyCircleAvatar({
    Key? key,
    this.image,
    this.initials,
    this.backgroundColor,
    this.radius = 28,
    this.onTap,
    this.textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundColor == null ? context.primaryColor : backgroundColor;
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: initials==null?_imageProvider(image):null,
        radius: radius,
        child: initials == null
            ? null
            : Text(
                initials!,
                style: textStyle??TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

ImageProvider _imageProvider(image) {
  if (image == null) return AssetImage('assets/images/avatar.png');
  if (image is Uint8List) return MemoryImage(image);
  if (image is File) return FileImage(image);
  String imageUrl = image;
  if (imageUrl.startsWith("assets")) return AssetImage(imageUrl);

  return NetworkImage(imageUrl);
}
