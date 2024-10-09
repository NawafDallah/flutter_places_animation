import 'package:flutter/material.dart';

class ShiftCircleAvatat extends StatelessWidget {
  const ShiftCircleAvatat({
    super.key,
    required this.image,
    this.witdhFactor = 0.7,
    this.padding = 2.0,
  });

  final String image;
  final double? witdhFactor;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: witdhFactor,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
