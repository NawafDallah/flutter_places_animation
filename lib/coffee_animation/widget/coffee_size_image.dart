import 'package:flutter/material.dart';

class CoffeeSizeImage extends StatelessWidget {
  const CoffeeSizeImage({
    super.key,
    required this.image,
    required this.letterSize,
  });

  final Image image;
  final String letterSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        image,
        const SizedBox(height: 8.0),
        Text(
          letterSize,
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
