import 'package:flutter/material.dart';

class CoffeeShadow extends StatelessWidget {
  const CoffeeShadow({
    super.key,
    required this.blurRadius,
    required this.spreadRadius,
    this.color = const Color(0xFF000000),
  });

  final double blurRadius;
  final double spreadRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            color: color,
          )
        ],
      ),
    );
  }
}
