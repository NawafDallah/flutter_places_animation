import 'package:flutter/material.dart';

import 'data/album_model.dart';
import 'widget/animated_header_album.dart';

const _maxHeightImageAlbum = 160.0;
const _minHeightImageAlbum = 60;

const _maxArtistName = 30.0;
const _minArtistName = 18.0;

const _maxAlbumName = 18.0;
const _minAlbumName = 12.0;

class AlbumDetails extends StatefulWidget {
  const AlbumDetails({super.key});

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  late final ScrollController _scrollController;
  late final ValueNotifier<bool> _isAnimatingScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _isAnimatingScroll = ValueNotifier(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.position.isScrollingNotifier
          .addListener(_isScrollingListener);
    });
    super.initState();
  }

  void _isScrollingListener() {
    double headerHeight = MediaQuery.of(context).size.height * 0.4;
    double percent = _scrollController.offset / headerHeight;
    if (!_scrollController.position.isScrollingNotifier.value) {
      if (percent < 1.0 && percent > 0.5) {
        _isAnimatingScroll.value = true;
        _scrollController
            .animateTo(
              headerHeight,
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
            )
            .then((value) => _isAnimatingScroll.value = false);
      } else if (percent < 0.5 && percent > 0.0) {
        _isAnimatingScroll.value = true;
        _scrollController
            .animateTo(
              0.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.decelerate,
            )
            .then((value) => _isAnimatingScroll.value = false);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ValueListenableBuilder(
        valueListenable: _isAnimatingScroll,
        builder: (_, value, child) {
          return AbsorbPointer(
            absorbing: value,
            child: child,
          );
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverPersistentHeader(
              delegate: AlbumDeleaget(
                maxExtent: size.height * 0.4,
                minExtent: kToolbarHeight * 2.0,
                builder: (percent) {
                  final imagePercent = (_maxHeightImageAlbum * (1 - percent))
                      .clamp(_minHeightImageAlbum, _maxHeightImageAlbum)
                      .toDouble();
                  final artistNamePercent = (_maxArtistName * (1 - percent))
                      .clamp(_minArtistName, _maxArtistName)
                      .toDouble();
                  final albumNamePercent = (_maxAlbumName * (1 - percent))
                      .clamp(_minAlbumName, _maxAlbumName)
                      .toDouble();
                  return AnimatedHeaderAlbum(
                    imagePercent: imagePercent,
                    size: size,
                    artistNamePercent: artistNamePercent,
                    albumNamePercent: albumNamePercent,
                    percent: percent,
                  );
                },
              ),
              pinned: true,
            ),
            SliverFillRemaining(
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}

class AlbumDeleaget extends SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  AlbumDeleaget(
      {required double maxExtent,
      required double minExtent,
      required this.builder})
      : _maxExtent = maxExtent,
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
