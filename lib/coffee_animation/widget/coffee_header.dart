import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/responsive.dart';

class CoffeeHeader extends StatelessWidget {
  const CoffeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Positioned(
      top: kToolbarHeight / 1.5,
      right: 0.0,
      left: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(CupertinoIcons.back, size: 32.0),
          // ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bag, size: isTablet ? 44.0 : 32.0),
          )
        ],
      ),
    );
  }
}
