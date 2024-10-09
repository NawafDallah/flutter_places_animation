import 'package:flutter/material.dart';

class Locationbutton extends StatelessWidget {
  const Locationbutton({
    super.key,
    this.width = 70,
    this.height = 70,
    required this.icon,
  });
  final double? width;
  final double? height;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: icon),
    );
  }
}
