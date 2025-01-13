import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import '../styles.dart';

class VultureIcon extends StatelessWidget {
  const VultureIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Transform.scale(
      scale: isTablet ? 2.0 : 1.0,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            Image.asset("assets/images/animal_images/vultures.png"),
            const SizedBox(height: 5.0),
            const Text("Vulture", style: TextStyle(color: white)),
          ],
        ),
      ),
    );
  }
}

class LeopardIcon extends StatelessWidget {
  const LeopardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Transform.scale(
      scale: isTablet ? 2.0 : 1.0,
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          children: [
            Image.asset("assets/images/animal_images/leopards.png"),
            const SizedBox(height: 5.0),
            const Text("Leopard", style: TextStyle(color: white)),
          ],
        ),
      ),
    );
  }
}
