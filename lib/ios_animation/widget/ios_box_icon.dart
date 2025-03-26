import 'package:flutter/material.dart';

class IosBoxIcon extends StatelessWidget {
  const IosBoxIcon({
    super.key,
    required this.icon,
    required this.color,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}
