import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/travel_place_model.dart';
import 'shift_circle_avatar.dart';

class CommentsBox extends StatelessWidget {
  const CommentsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.deepPurple.shade800,
      ),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            ShiftCircleAvatat(image: TravelUser.users[i].urlPhoto),
          const SizedBox(width: 10),
          Text(
            'Comments',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "120",
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
