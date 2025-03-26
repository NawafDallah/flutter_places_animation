import 'package:flutter/material.dart';

class FadeIcon extends StatelessWidget {
  const FadeIcon({
    super.key,
    required this.icon,
    this.duration = 300,
    required ValueNotifier scrollListener,
  }) : _scrollListener = scrollListener;

  final ValueNotifier _scrollListener;
  final Icon icon;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _scrollListener,
      builder: (_, value, child) {
        final double percent = value / (kToolbarHeight * 2);
        return AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          opacity: percent >= 1.0 ? 1.0 : 0.0,
          child: child,
        );
      },
      child: icon,
    );
  }
}
