import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/travel_place_model.dart';
import 'stutas_tag.dart';

class CardPlace extends StatelessWidget {
  const CardPlace({super.key, required this.place, required this.onTap});

  final TravelPlace place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tag = place.statusTag;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            image: NetworkImage(place.imagesUrl.first),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black26,
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(place.user.urlPhoto),
                ),
                const SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.user.name,
                      style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "yesterday at 12:00 p.m",
                      style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              ],
            ),
            const Spacer(),
            Text(
              place.name,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 10.0),
            MyStatusTag(tag: tag),
            const Spacer(),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(CupertinoIcons.heart),
                  label: Text(
                    place.likes.toString(),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(CupertinoIcons.reply),
                  label: Text(
                    place.shared.toString(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
