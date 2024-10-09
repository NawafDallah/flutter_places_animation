import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'models/travel_place_model.dart';
import 'widget/animated_place_details.dart';
import 'widget/collection_places.dart';
import 'widget/comments_box.dart';
import 'widget/location_button.dart';
import 'widget/translate_animation.dart';

class DetailsPlacePage extends StatefulWidget {
  const DetailsPlacePage({
    super.key,
    required this.place,
    required this.height,
  });

  final TravelPlace place;
  final double height;

  @override
  State<DetailsPlacePage> createState() => _DetailsPlacePageState();
}

class _DetailsPlacePageState extends State<DetailsPlacePage> {
  late final ScrollController _scrollController;
  late final ValueNotifier<double> _valueNotifier;

  void _onListen() {
    double newValue = _scrollController.offset / widget.height;
    _valueNotifier.value = (newValue / 0.25).clamp(0.0, 1.0);
  }

  void _isScrollingListener() {
    double percent = _scrollController.offset / widget.height;
    if (!_scrollController.position.isScrollingNotifier.value) {
      if (percent < 0.3 && percent > 0.1) {
        _scrollController.animateTo(
          widget.height * 0.4,
          duration: const Duration(milliseconds: 150),
          curve: Curves.decelerate,
        );
      }
      if (percent < 0.1 && percent > 0.0) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.decelerate,
        );
      }
      if (percent < 0.5 && percent > 0.3) {
        _scrollController.animateTo(
          widget.height * 0.4,
          duration: const Duration(milliseconds: 150),
          curve: Curves.decelerate,
        );
      }
    }
  }

  @override
  void initState() {
    _valueNotifier = ValueNotifier<double>(0.0);
    _scrollController = ScrollController(
      initialScrollOffset: widget.height * 0.4,
    )..addListener(_onListen);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.position.isScrollingNotifier
          .addListener(_isScrollingListener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onListen)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: BuilderSliverDelegate(
                  maxExtent: hieght,
                  minExtent: hieght / 3,
                  builder: (percent) {
                    return AnimatedHeaderDetails(
                      place: widget.place,
                      bottomPercent: (percent / 0.5).clamp(0.0, 1.0),
                      topPercent: (1 - (percent / 0.7)).clamp(0.0, 1.0),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                  child: TranslationAnimation(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.black26),
                          Flexible(
                            child: Text(
                              widget.place.locationDescription,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                textStyle:
                                    Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(widget.place.description),
                      const SizedBox(height: 10),
                      Text(widget.place.description),
                      const SizedBox(height: 10),
                      Text(widget.place.description),
                      const SizedBox(height: 10),
                      Text(widget.place.description),
                      const SizedBox(height: 30),
                      Text(
                        "PLACE IN THIS COLLICTION",
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 180,
                  child: CollectionPlaces(widget: widget),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 150.0))
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (_, value, child) => Positioned.fill(
              top: null,
              bottom: -150 * (1 - value),
              child: child!,
            ),
            child: Container(
              height: widget.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white,
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    CommentsBox(),
                    Spacer(),
                    Locationbutton(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuilderSliverDelegate extends SliverPersistentHeaderDelegate {
  final double _maxExtent;
  final double _minExtent;
  final Widget Function(double percent) builder;

  BuilderSliverDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
