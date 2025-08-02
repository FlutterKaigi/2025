import 'package:flutter/material.dart';

class AccountCircleImage extends StatelessWidget {
  const AccountCircleImage({
    this.imageUrl,
    this.radius = 40,
    super.key,
  });

  final String? imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? Icon(Icons.person, size: radius) : null,
    );
  }
}