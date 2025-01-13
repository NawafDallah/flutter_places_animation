import 'package:flutter/material.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';

import '../core/responsive.dart';
import 'data/album_model.dart';
import 'widget/animated_header_album.dart';

const _maxHeightImageAlbum = 160.0;
const _minHeightImageAlbum = 60;

const _maxHeightImageAlbumTablet = 220.0;
const _minHeightImageAlbumTablet = 60;

const _maxArtistName = 30.0;
const _minArtistName = 18.0;

const _maxArtistNameTablet = 42.0;
const _minArtistNameTablet = 24.0;

const _maxAlbumName = 18.0;
const _minAlbumName = 12.0;

const _maxAlbumNameTablet = 24.0;
const _minAlbumNameTablet = 16.0;

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: SnapScrollPhysics.preventStopBetween(
          kToolbarHeight,
          size.height * 0.3,
        ),
        slivers: [
          SliverPersistentHeader(
            delegate: AlbumDeleaget(
              maxExtent: size.height * 0.4,
              minExtent: kToolbarHeight * 2.0,
              builder: (percent) {
                final imagePercent = (_maxHeightImageAlbum * (1.0 - percent))
                    .clamp(_minHeightImageAlbum, _maxHeightImageAlbum)
                    .toDouble();
                final artistNamePercent = (_maxArtistName * (1 - percent))
                    .clamp(_minArtistName, _maxArtistName)
                    .toDouble();
                final albumNamePercent = (_maxAlbumName * (1 - percent))
                    .clamp(_minAlbumName, _maxAlbumName)
                    .toDouble();
                final imageTabletPercent = (_maxHeightImageAlbumTablet *
                        (1 - percent))
                    .clamp(
                        _minHeightImageAlbumTablet, _maxHeightImageAlbumTablet)
                    .toDouble();
                final artistNamePercentTablet =
                    (_maxArtistNameTablet * (1 - percent))
                        .clamp(_minArtistNameTablet, _maxArtistNameTablet)
                        .toDouble();
                final albumNamePercentTablet =
                    (_maxAlbumNameTablet * (1 - percent))
                        .clamp(_minAlbumNameTablet, _maxAlbumNameTablet)
                        .toDouble();
                return AnimatedHeaderAlbum(
                  imagePercent: imagePercent,
                  size: size,
                  artistNamePercent: artistNamePercent,
                  albumNamePercent: albumNamePercent,
                  percent: percent,
                  imageTabletPercent: imageTabletPercent,
                  artistNamePercentTablet: artistNamePercentTablet,
                  albumNamePercentTablet: albumNamePercentTablet,
                );
              },
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Text(
                      AlbumModel.currentAlbum.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        wordSpacing: 1.5,
                      ),
                    ),
                  ),
                  if (Responsive.isTablet(context))
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        AlbumModel.currentAlbum.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          wordSpacing: 1.5,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumDeleaget extends SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  AlbumDeleaget({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
