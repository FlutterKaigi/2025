import 'package:flutter/material.dart';

final class AccountCircleImage extends StatelessWidget {
  const AccountCircleImage({
    required String imageUrl,
    double imageSize = 100,
    double circleRadius = 50,
    double errorIconSize = 50,
    super.key,
  }) : _imageUrl = imageUrl,
       _imageSize = imageSize,
       _circleRadius = circleRadius,
       _errorIconSize = errorIconSize;

  final String _imageUrl;
  final double _imageSize;
  final double _circleRadius;
  final double _errorIconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _circleRadius,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ClipOval(
        child: Image.network(
          _imageUrl,
          width: _imageSize,
          height: _imageSize,
          fit: BoxFit.contain,
          webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.person,
              size: _errorIconSize,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            );
          },
        ),
      ),
    );
  }
}
