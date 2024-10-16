import 'package:flutter/material.dart';

import '../data/album_model.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

const _leftMargin = 170.0;
const _topMargin = 170.0;

const _topMarginText = 80.0;
const _leftMarginText = 80.0;

class AnimatedHeaderAlbum extends StatelessWidget {
  const AnimatedHeaderAlbum({
    super.key,
    required this.imagePercent,
    required this.size,
    required this.artistNamePercent,
    required this.albumNamePercent,
    required this.percent,
  });

  final double imagePercent;
  final Size size;
  final double artistNamePercent;
  final double albumNamePercent;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      child: Stack(
        children: [
          Positioned(
            left: (_leftMargin * (1 - percent)).clamp(35, _leftMargin),
            top: (_topMargin * (1 - percent))
                .clamp(kToolbarHeight / 2, _topMargin),
            height: imagePercent,
            child: Transform.rotate(
              angle: vector.radians(-360 * percent),
              child: Image.asset(
                AlbumModel.currentAlbum.imageDisk,
              ),
            ),
          ),
          Positioned(
            left: 35,
            top: (_topMargin * (1 - percent))
                .clamp(kToolbarHeight / 2, _topMargin),
            height: imagePercent,
            child: Image.asset(
              AlbumModel.currentAlbum.imageAlbum,
            ),
          ),
          Positioned(
            left: size.width / 2 - _leftMarginText,
            top: (_topMarginText * (1 - percent))
                .clamp(kToolbarHeight / 1.5, _topMarginText),
            height: imagePercent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AlbumModel.currentAlbum.albumArtist,
                  style: TextStyle(
                    fontSize: artistNamePercent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AlbumModel.currentAlbum.albumName,
                  style: TextStyle(
                    fontSize: albumNamePercent,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                    wordSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
