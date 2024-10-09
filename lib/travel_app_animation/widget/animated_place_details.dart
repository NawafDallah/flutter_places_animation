import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/travel_app_animation/widget/stutas_tag.dart';
import 'package:flutter_animation/travel_app_animation/widget/translate_animation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_animation/travel_app_animation/widget/horizontal_images.dart';

import '../models/travel_place_model.dart';

class AnimatedHeaderDetails extends StatelessWidget {
  const AnimatedHeaderDetails({
    super.key,
    required this.place,
    required this.bottomPercent,
    required this.topPercent,
  });

  final TravelPlace place;
  final double bottomPercent;
  final double topPercent;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding.top;
    final double contentBottomPercent = 1 - (bottomPercent / 0.5).clamp(0, 1);
    final double contentTopPercent = 1 - (topPercent / 0.40).clamp(0, 1);
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: place.id,
          child: Material(
            child: ClipRect(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: (padding + 20) * (1 - bottomPercent),
                      bottom: 160 * (1 - bottomPercent),
                    ),
                    child: Transform.scale(
                      scale: lerpDouble(1.0, 1.3, bottomPercent)!,
                      child: HorizontalImages(place: place),
                    ),
                  ),
                  Positioned(
                    left: -60 * contentBottomPercent,
                    top: padding,
                    child: const BackButton(color: Colors.white),
                  ),
                  Positioned(
                    right: -60 * contentBottomPercent,
                    top: padding,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz, color: Colors.white)),
                  ),
                  Positioned(
                    left: lerpDouble(20, 50, contentTopPercent),
                    top: lerpDouble(180, padding + 5, contentTopPercent),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: contentBottomPercent != 0.0 ? 0.0 : 1.0,
                      child: Text(
                        place.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: lerpDouble(40, 25, contentTopPercent),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 235,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity:
                          contentBottomPercent != 0.0 || contentTopPercent != 0.0
                              ? 0.0
                              : 1.0,
                      child: MyStatusTag(tag: place.statusTag),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: null,
          bottom: -140 * (contentTopPercent),
          child: TranslationAnimation(child: _LikesAndShares(place: place)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(color: Colors.white, height: 20),
        ),
        Positioned.fill(
          top: null,
          child: TranslationAnimation(child: _UserInfoContainer(place: place)),
        ),
      ],
    );
  }
}

class _UserInfoContainer extends StatelessWidget {
  const _UserInfoContainer({required this.place});

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Material(
            type: MaterialType.transparency,
            child: CircleAvatar(
              backgroundImage: AssetImage(place.user.urlPhoto),
            ),
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
                  color: Colors.black,
                ),
              ),
              Text(
                "yesterday at 12:00 p.m",
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              foregroundColor: Colors.cyan.shade600,
            ),
            child: Text(
              "+ Follow",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.cyan.shade600,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LikesAndShares extends StatelessWidget {
  const _LikesAndShares({required this.place});

  final TravelPlace place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
        color: Colors.cyan.shade50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const StadiumBorder(),
              foregroundColor: Colors.black,
            ),
            icon: const Icon(CupertinoIcons.heart, size: 30.0),
            label: Text(
              place.likes.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: const StadiumBorder(),
              foregroundColor: Colors.black,
            ),
            icon: const Icon(CupertinoIcons.reply, size: 30.0),
            label: Text(
              place.shared.toString(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              backgroundColor: Colors.cyan.shade100,
              foregroundColor: Colors.cyan.shade600,
            ),
            icon: const Icon(CupertinoIcons.reply, size: 26.0),
            label: Text(
              "Checkin",
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                color: Colors.cyan.shade600,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
