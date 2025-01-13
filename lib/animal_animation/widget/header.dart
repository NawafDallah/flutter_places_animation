import 'package:flutter/material.dart';

import '../../core/responsive.dart';
import '../styles.dart';

class Header extends StatelessWidget {
  const Header({super.key, this.animation});

  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      top: kToolbarHeight / 1.5,
      left: isTablet ? 40.0 : 20.0,
      right: isTablet ? 40.0 : 20.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Material(
            type: MaterialType.transparency,
            child: Text(
              'SY',
              style: TextStyle(
                color: white,
                fontSize: 20.0,
                letterSpacing: 3.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: animation != null ? 0.0 : 1.0,
            child: const Icon(
              Icons.density_large_outlined,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
