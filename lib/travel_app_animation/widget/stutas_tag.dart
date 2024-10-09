import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/travel_place_model.dart';

class MyStatusTag extends StatelessWidget {
  const MyStatusTag({
    super.key,
    required this.tag,
  });

  final StatusTag tag;

  @override
  Widget build(BuildContext context) {
    String text;
    List<Color> colors;
    switch (tag) {
      case StatusTag.popular:
        text = "Popular Place";
        colors = [Colors.amber, Colors.orange];
        break;
      case StatusTag.event:
        text = "Event Place";
        colors = [Colors.blueGrey, Colors.blueAccent];
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(colors: colors),
      ),
      child: Text(
        text,
        style: GoogleFonts.aBeeZee(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          textStyle: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
