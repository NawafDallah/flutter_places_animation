import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/responsive.dart';

class CoffeeHeaderName extends StatelessWidget {
  const CoffeeHeaderName({super.key, required this.coffeeName});

  final String coffeeName;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.75,
        minWidth: 20.0,
      ),
      child: Text(
        coffeeName,
        maxLines: 2,
        softWrap: true,
        textAlign: TextAlign.center,
        style: GoogleFonts.mali(
          fontSize: 32.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class CoffeeHeaderPrice extends StatelessWidget {
  const CoffeeHeaderPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Text(
      "${price.toString()}SR",
      style: GoogleFonts.mali(
        fontSize: isTablet ? 38.0 : 28.0,
        fontWeight: FontWeight.w600,
        color: Colors.black45,
      ),
    );
  }
}
