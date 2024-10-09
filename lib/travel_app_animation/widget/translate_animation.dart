import 'package:flutter/material.dart';

class TranslationAnimation extends StatelessWidget {
  const TranslationAnimation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutBack,
      builder: (_, value, child) => Transform.translate(
        offset: Offset(0.0, value * 100),
        child: child!,
      ),
      child: child,
    );
  }
}
