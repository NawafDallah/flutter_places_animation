import 'package:flutter/material.dart';

class ShimmerArrow extends StatelessWidget {
  const ShimmerArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
            heightFactor: 0.4,
            child: Icon(Icons.keyboard_arrow_up, size: 42.0)),
        Align(
            heightFactor: 0.4,
            child: Icon(Icons.keyboard_arrow_up, size: 42.0)),
        Align(
            heightFactor: 0.4,
            child: Icon(Icons.keyboard_arrow_up, size: 42.0)),
        Align(
            heightFactor: 0.4,
            child: Icon(Icons.keyboard_arrow_up, size: 42.0)),
      ],
    );
  }
}
