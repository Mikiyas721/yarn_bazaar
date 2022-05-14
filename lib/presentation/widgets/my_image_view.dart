import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

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
  final double radius;
  final VoidCallback? onTap;

  const MyCircleAvatar({
    Key? key,
    this.image,
    this.radius = 28,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: _imageProvider(image),
        radius: radius,
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
