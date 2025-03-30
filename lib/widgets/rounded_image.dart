import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  const RoundedImageWidget({
    super.key,
    this.width,
    this.height,
    this.applyImageRadius = false,
    required this.imageUrl,
    this.border,
    this.backgroundColor = Colors.transparent,
    this.isNetworkImage = false,
    this.fit,
    this.padding,
    this.onPressed,
    this.borderRadius = 20,
  });
  final double? width, height;
  final bool applyImageRadius;
  final String imageUrl;
  final BoxBorder? border;
  final Color backgroundColor;
  final bool isNetworkImage;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
