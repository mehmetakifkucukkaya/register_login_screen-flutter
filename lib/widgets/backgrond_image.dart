import 'package:flutter/material.dart';

class BackgrondImage extends StatelessWidget {
  const BackgrondImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}