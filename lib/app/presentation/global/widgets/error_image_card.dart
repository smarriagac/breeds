import 'package:flutter/material.dart';

class ErrorCatImage extends StatelessWidget {
  const ErrorCatImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/not_image.png',
      fit: BoxFit.contain,
    );
  }
}
